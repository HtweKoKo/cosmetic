import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
 
  @override
  Widget build(BuildContext context) {
    int isSelected = context.watch<BuyNowController>().selected;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
           context.read<BuyNowController>().selectedPayment();
          },
          child: Container(
            width: 150.w,
            height: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MyColors.primary,
                border: Border.all(
                  color: MyColors.stoke,
                ),
                boxShadow:isSelected  == 1
                    ? [
                        BoxShadow(
                            color: MyColors.accent,
                            offset: Offset(1, 1),
                            blurRadius: 0.5,
                            spreadRadius: 0.6)
                      ]
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: AssetImage("assets/images/kpay_logo.png"),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Kpay",
                  style: TextStyle(
                      color: MyColors.normal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),

        InkWell(
          onTap: () {
           context.read<BuyNowController>().selectedPayment();
           
          },
          child: Container(
            width: 150.w,
            height: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: MyColors.primary,
                border: Border.all(
                  color: MyColors.stoke,
                ),
                boxShadow: isSelected == 2
                    ? [
                        BoxShadow(
                            color: MyColors.accent,
                            offset: Offset(1, 1),
                            blurRadius: 0.5,
                            spreadRadius: 0.6)
                      ]
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 30.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      image: DecorationImage(
                          image: AssetImage("assets/images/wave_money.png"),
                          fit: BoxFit.fill)),
                ),
                Text(
                  "Wave",
                  style: TextStyle(
                      color: MyColors.normal,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}