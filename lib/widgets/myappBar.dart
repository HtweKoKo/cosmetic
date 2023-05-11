import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/widgets/cart.dart';

PreferredSizeWidget myAppbar({required String title,
    List<Widget>? actions}
){

  return AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              color: MyColors.normal,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        actions: actions,
      );
}