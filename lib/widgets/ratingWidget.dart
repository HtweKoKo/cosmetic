import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';

class RatingWidget extends StatelessWidget {
   dynamic rating;

   RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
      if (rating == 5.0) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar()
        ],
      );
    } else if (rating>= 4.5 && rating <= 4.9) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _halfStar()
        ],
      );
    } else if (rating >= 4.0 && rating < 4.5) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _noStar()
        ],
      );
    } else if (rating >= 3.5 && rating <= 3.9) {
      return Row(
        children: [
          _fullStar(),
          _fullStar(),
          _fullStar(),
          _halfStar(),
          _noStar()
        ],
      );
    } else if (rating >= 3.0 && rating < 3.5) {
      return Row(
        children: [_fullStar(), _fullStar(), _fullStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 2.5 && rating < 3.0) {
      return Row(
        children: [_fullStar(), _fullStar(), _halfStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 2.0 && rating < 2.5) {
      return Row(
        children: [_fullStar(), _fullStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 1.5 && rating < 2.0) {
      return Row(
        children: [_fullStar(), _halfStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 1.0 && rating < 1.5) {
      return Row(
        children: [_fullStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    } else if (rating >= 0.5 && rating < 1.0) {
      return Row(
        children: [_halfStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    } else {
      return Row(
        children: [_noStar(), _noStar(), _noStar(), _noStar(), _noStar()],
      );
    }
  }
   Widget _fullStar() {
    return Icon(
      Icons.star,
      size: 20.sp,
      color:MyColors.accent ,
    );
  }

  Widget _halfStar() {
    return Icon(
      Icons.star_half,
      size: 20.sp,
      color:MyColors.accent,
    );
  }

  Widget _noStar() {
    return Icon(
      Icons.star_border,
      size: 20.sp,
      color: MyColors.accent,
    );
  }
}