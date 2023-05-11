import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/pages/product_detail.dart';

class HomeCardWidget extends StatelessWidget {
  final Product product;

  const HomeCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(ProductDetail(product: product));
      },
      child: Container(
                  width: 330.w,
                  height: 120.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                      color: MyColors.secondy,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 5,
                            spreadRadius: 0.8,
                            color: Color.fromARGB(255, 131, 131, 131))
                      ]),
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.h,
                        decoration: BoxDecoration(
                            color: MyColors.normal,
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                                image: NetworkImage(
                                    product.image_link ??""))),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        width: 200.w,
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.toString(),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                Text(
                                  product.product_type.toString(),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: MyColors.hint,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "\$ ${product.price}",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
}
}