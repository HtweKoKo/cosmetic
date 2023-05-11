import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:provider/provider.dart';

import '../data/models/product.dart';

class SearchBar extends StatelessWidget {
  TextEditingController searchText = TextEditingController();
 final List<Product> makeupProduct;

 SearchBar({super.key, required this.makeupProduct});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: searchText,
      decoration: InputDecoration(
          fillColor: MyColors.normal,
          filled: true,
          hintText: MyText.search,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: MyColors.hint),
          suffixIcon: IconButton(
            onPressed:(){
              context.read<GetProductController>().searchProducts(makeupProduct, searchText.text);
            } ,
            icon: Icon(
              Icons.search,
             
            ),
            ),
          contentPadding: EdgeInsets.only(left: 10.w),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: MyColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(30.r))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: MyColors.primary),
              borderRadius: BorderRadius.all(Radius.circular(30.r)))),
    );
  }
}
