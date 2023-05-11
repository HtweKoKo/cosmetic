import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/pages/about.dart';
import 'package:online_shop_app/pages/contact_us.dart';
import 'package:online_shop_app/pages/history.dart';
import 'package:online_shop_app/pages/home.dart';
import 'package:online_shop_app/pages/your_cart.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        key: _key,
        backgroundColor: MyColors.normal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      width: 130.w,
                      height: 130.w,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset("assets/images/setting.png")),
                  Text(
                    " Setting",
                    style: TextStyle(
                        color: MyColors.accent,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _drawerBtn(
                      Icons.home_outlined, "Home", () => Get.to(() => Home())),
                  _drawerBtn(Icons.shopping_cart, "Your Cart", () {
                    Get.to(() => YourCart());
                  }),
                  _drawerBtn(Icons.history, "History", () {
                    Get.to(() => HistoryCart());
                  }),
                  _drawerBtn(Icons.info_outline, "About", () {
                    Get.back();
                    Get.to(() => About());
                  }),
                  _drawerBtn(Icons.people_outline, "Contact Us", () {
                    Get.back();
                    Get.to(() => ContactUs());
                  }),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _drawerBtn(icon, String text, onClick) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w)),
          onPressed: onClick,
          child: Row(
            children: [
              Icon(
                icon,
                size: 30.sp,
                color: MyColors.accent,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                text,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              )
            ],
          )),
    );
  }
}
