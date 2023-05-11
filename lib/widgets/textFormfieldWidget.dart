import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint_text;
  int? maxline;

   TextFormFieldWidget({super.key, required this.controller, required this.hint_text,this.maxline =1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: TextFormField(
        maxLines: maxline,
          controller: controller,
          cursorColor: MyColors.normal,
          style: TextStyle(color: MyColors.normal, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.w),
            hintText: hint_text,
            hintStyle: TextStyle(color: MyColors.hint),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.normal),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.normal),
            ),
          )),
    );
  }
}