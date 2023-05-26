import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/widgets/textFormfieldWidget.dart';

import '../constant/helpers/my_colors.dart';
import '../constant/helpers/my_text.dart';

class AddAdderess extends StatelessWidget {
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _addressController = TextEditingController();

    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        elevation: 0,
        title: Text(MyText.add_address),
        backgroundColor: MyColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormFieldWidget(
                      controller: _nameController,
                      hint_text: "Customer's name"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldWidget(
                      controller: _phoneController,
                      hint_text: "Customer's phone number"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldWidget(
                      controller: _emailController,
                      hint_text: "Customer's email"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormFieldWidget(
                    controller: _addressController,
                    hint_text: "Customer's address",
                    maxline: 5,
                  ),
                ],
              )),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, [
                      _nameController.text,
                      _phoneController.text,
                      _emailController.text,
                      _addressController.text
                    ]);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      primary: MyColors.accent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r))),
                  child: Text(
                    MyText.add_address,
                    style: TextStyle(
                        color: MyColors.normal,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
