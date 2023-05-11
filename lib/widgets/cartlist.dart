import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:online_shop_app/pages/product_detail.dart';
import 'package:online_shop_app/widgets/Count.dart';
import 'package:provider/provider.dart';

import '../data/models/cartData.dart';

class CartList extends StatelessWidget {
  final CartData cartData;

  const CartList({super.key, required this.cartData});
  @override
  Widget build(BuildContext context) {
    var productList = context.watch<GetProductController>().products;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Product product = context
                .read<YourCartController>()
                .getSingleProduct(productList, cartData.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(product: product)));
          },
          child: Container(
            width: 330.w,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(bottom: 5.h, right: 15.w, left: 15.w),
            decoration: BoxDecoration(
                color: MyColors.secondy,
                borderRadius: BorderRadius.circular(10.r)),
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
                      ),
                      child: Image.network(cartData.image_link),
                    ),
                    Container(
                      width: 230.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            cartData.name,
                            style: TextStyle(
                                color: MyColors.accent,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade),
                          ),
                          Text(
                            cartData.product_type,
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
                          "\$ ${cartData.price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Count(
                            text: "-",
                            click: () {
                              context
                                  .read<YourCartController>()
                                  .removeCartCount(cartData);
                            }),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              cartData.count.toString(),
                              style: TextStyle(
                                  color: MyColors.accent,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                        Count(
                            text: "+",
                            click: () {
                              context
                                  .read<YourCartController>()
                                  .addCountItem(cartData);
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Container(
                        width: 180.w,
                        height: 30.w,
                        child: ElevatedButton(
                            onPressed: () {
                              Product product = context
                                  .read<YourCartController>()
                                  .getSingleProduct(productList, cartData.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BuyNow(product: product)));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.accent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r))),
                            child: Text(
                              MyText.buy_now,
                              style: TextStyle(
                                  color: MyColors.normal,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 5.w,
          top: -10.h,
          child: IconButton(
              onPressed: () {
                context
                    .read<YourCartController>()
                    .deleteSingleProducts(cartData);
              },
              icon: Icon(
                Icons.close,
                color: MyColors.accent,
                size: 18.sp,
              )),
        )
      ],
    );
  }
}
