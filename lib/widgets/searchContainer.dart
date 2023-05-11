import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/pages/SearchPage.dart';

import '../constant/helpers/my_colors.dart';

class SearchContainer extends StatelessWidget {
final List<Product> productList;

  const SearchContainer({super.key, required this.productList});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(
            builder: (context)=> SearchPage())
          );
      },
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.r)),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MyText.search,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: MyColors.hint),
              ),
              Icon(
                Icons.search,
                color: MyColors.accent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
