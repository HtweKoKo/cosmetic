import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/pages/add_address.dart';
import 'package:online_shop_app/widgets/Count.dart';
import 'package:online_shop_app/widgets/addAddressDataWidget.dart';
import 'package:online_shop_app/widgets/confirm.dart';
import 'package:online_shop_app/widgets/myDrawer.dart';
import 'package:online_shop_app/widgets/myappBar.dart';
import 'package:online_shop_app/widgets/payment.dart';
import 'package:provider/provider.dart';

class BuyNow extends StatefulWidget {
  Product product;
  BuyNow({Key? key, required this.product}) : super(key: key);

  @override
  State<BuyNow> createState() => _BuyNowState(this.product);
}

class _BuyNowState extends State<BuyNow> {
  Product product;

  _BuyNowState(this.product);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BuyNowController>(
      create: (context) => BuyNowController(),
      child: Scaffold(
          backgroundColor: MyColors.primary,
          appBar: myAppbar(title: MyText.buy_now),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddAddressDataWidget(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Text(
                        MyText.items,
                        style: TextStyle(
                            color: MyColors.normal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ProductCard(
                      product: product,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            MyText.payment,
                            style: TextStyle(
                                color: MyColors.normal,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            MyText.view_all_payment,
                            style: TextStyle(
                              color: MyColors.hint,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Payment(),
                  ],
                ),
              ),
              Confirm(product: product)
            ],
          )),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          color: MyColors.secondy, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70.w,
                height: 70.w,
                margin: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                    color: MyColors.normal,
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(product.image_link.toString()),
                        fit: BoxFit.contain)),
              ),
              Container(
                width: 230.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name.toString(),
                      style: TextStyle(
                          color: MyColors.accent,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade),
                    ),
                    Text(
                      product.product_type.toString(),
                      style: TextStyle(
                        color: MyColors.hint,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80.w,
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Consumer<BuyNowController>(builder: (context, value, child) {
                return Row(
                  children: [
                    Count(
                        text: "-",
                        click: () {
                        value.decreaseCount();
                         value.singleProductTotalPrice(productPrice: double.parse(product.price!));

                        }),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(value.count.toString())),
                    Count(
                        text: "+",
                        click: () {
                         value.increaseCount();
                         value.singleProductTotalPrice(productPrice: double.parse(product.price!));
                        }),
                  ],
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
