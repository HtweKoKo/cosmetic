import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';

class Count extends StatelessWidget {
 final String text;
  Function()? click;

   Count({super.key, required this.text,  this.click});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        width: 15.w,
        height: 15.w,
        decoration: BoxDecoration(
            color: MyColors.normal,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                offset: Offset(0.5, 0.5),
                blurRadius: 0.3,
              )
            ]),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: MyColors.accent,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}