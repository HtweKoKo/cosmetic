

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/widgets/HomeCardWidget.dart';
import 'package:online_shop_app/widgets/searchBar.dart';
import 'package:provider/provider.dart';

import '../constant/helpers/my_colors.dart';
import '../constant/helpers/my_text.dart';
import '../widgets/cart.dart';
import '../widgets/myDrawer.dart';
import '../widgets/myappBar.dart';

class SearchPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var productList = context.watch<GetProductController>().products;
    return Scaffold(
        drawer: MyDrawer(),
        appBar: myAppbar(title: MyText.cosmetic_app, actions: [Cart()]),
        body: SafeArea(
            child: Stack(children: [
          Container(
            height: 200.h,
            color: MyColors.primary,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
                color: MyColors.hint,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBar(makeupProduct: productList),
                SizedBox(
                  height: 10.h,
                ),
                Consumer<GetProductController>(builder: (context, value, _) {
                  List<Product> products = value.searchedProducts;

                  if (products.length != 0) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return HomeCardWidget(product: products[index]);
                          }),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: Text(
                      "No Products",
                      style: TextStyle(
                        color: Color.fromARGB(255, 235, 233, 233),
                        fontSize: 25,
                      ),
                    ),
                  );
                })
              ],
            ),
          )
        ])));
  }
}
