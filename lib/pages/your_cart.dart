import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/data/models/cartData.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/widgets/cartlist.dart';
import 'package:online_shop_app/widgets/myDrawer.dart';
import 'package:online_shop_app/widgets/myappBar.dart';
import 'package:provider/provider.dart';

import '../constant/helpers/my_colors.dart';

class YourCart extends StatelessWidget {
  const YourCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartData> listCart = context.watch<YourCartController>().listItem;
    List<Product> productList = context.watch<GetProductController>().products;

    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: myAppbar(title: "Your Cart"),
      drawer: MyDrawer(),
      body: Column(children: [
        Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: listCart.length,
              itemBuilder: (context, index) {
                CartData singleData = listCart[index];
                return CartList(
                  cartData: singleData,
                );
              },
            )),
        BuyAllButton()
      ]),
    );
  }
}

class BuyAllButton extends StatelessWidget {
  const BuyAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<YourCartController>(
      builder: (context, value, child) {
        return Expanded(
          flex: 1,
          child: Container(
            height: 50.h,
            color: MyColors.secondy,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "total Price:\$ ${(value.totalPrice).toStringAsFixed(2)}",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ElevatedButton(
                      onPressed: () {
                        showBuyAllAlerDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 10.h),
                          backgroundColor: MyColors.accent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r))),
                      child: Text(
                        "Buy All",
                        style: TextStyle(
                            color: MyColors.normal,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showBuyAllAlerDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            scrollable: true,
            title: Text(
              "Please check it again",
            ),
            actionsPadding: EdgeInsets.symmetric(vertical: 10.h),
            content: CheckItContent(),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Item Add"),
                        behavior: SnackBarBehavior.floating,
                        ));
                  },
                  child: Text("Ok")),
            ],
          );
        });
  }
}

class CheckItContent extends StatelessWidget {
  CheckItContent({super.key});
  int totalitem = 0;

  @override
  Widget build(BuildContext context) {
    return Selector<YourCartController, List<CartData>>(
        selector: (context, bloc) => bloc.listItem,
        builder: (context, totalProduct, child) {
          return Container(
            width: 250.w,
            height: 300.h,
            child: Column(
              children: [
                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                      itemCount: totalProduct.length,
                      itemBuilder: (context, index) {
                        totalitem += totalProduct[index].count;
                        return checkSingleProduct(totalProduct[index]);
                      }),
                ),
                totalItemAndTotalPrice()
              ],
            ),
          );
        });
  }

 Widget totalItemAndTotalPrice() {
    return Consumer<YourCartController>(
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "total items: ${value.totalItem}",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Total Cost: ${value.totalPrice}",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              );
  }

  Widget checkSingleProduct(CartData singleProduct) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: SizedBox(
            width: 120.w,
            child: Text(
              singleProduct.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ),
        Text("\t x ${singleProduct.count}"),
        Text("\t = ${(singleProduct.count * double.parse(singleProduct.price)).toStringAsFixed(2)}"),
      ],
    );
  }
}
