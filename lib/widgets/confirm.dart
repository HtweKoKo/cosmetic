import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:provider/provider.dart';

import '../constant/helpers/my_text.dart';

class Confirm extends StatelessWidget {
  final Product product;

  const Confirm({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 45.h,
            color: MyColors.secondy,
            child: Row(
              children: [
                Spacer(),
                Consumer<BuyNowController>(
                  builder: (context, value, chiid) {
                    return Row(
                      children: [
                        Text(
                          "Total : \$ ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          value.totalPrice ?? product.price!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                    width: 120.w,
                    height: 25.h,
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.accent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r))),
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Item Add"),
                        behavior: SnackBarBehavior.floating,
                        ));
                      },
                      child: Center(
                        child: Text(
                          MyText.comfirm,
                          style: TextStyle(
                              color: MyColors.normal,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
