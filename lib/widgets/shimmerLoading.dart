import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';

class ShimmerLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
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
                           ),
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
                                shimmerContainer(width: 200, height: 16),
                                SizedBox(height: 5,),
                                shimmerContainer(width: 60, height: 12)
                                
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                               shimmerContainer(width: 80, height: 20)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        }
  }

  Widget shimmerContainer(
      {required double width, required double height, double radius = 1}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Color.fromARGB(255, 148, 148, 148)),
    );
  }

