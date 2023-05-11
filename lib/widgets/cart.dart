import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/pages/your_cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart ({super.key});

  @override
  Widget build(BuildContext context) {
    // context.watch<YourCartController>().getCartData();
  
    return  Padding(
            padding: EdgeInsets.only(right: 5.h, top: 3.h),
            child: Stack(clipBehavior: Clip.none, children: [
              IconButton(
                onPressed: () {
                  Get.to(()=>YourCart());
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: MyColors.normal,
                  size: 20.sp,
                ),
              ),
              Positioned(
                top: 2.h,
                right: 3.h,
                child: Container(
                  width: 15.h,
                  height: 15.h,
                  decoration:
                      BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                  child: Center(
                    child: Consumer<YourCartController>(
                      builder: (BuildContext context, value, Widget? child) { 
                      
                        return  Text(
                       value.listItem.length.toString(),
                       
                        style: TextStyle(
                            color: MyColors.normal,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400),
                      );

                       },
                     
                    ),
                  ),
                ),
              )
            ]),
          );
  }
}