import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/widgets/HomeCardWidget.dart';
import 'package:online_shop_app/widgets/myDrawer.dart';
import 'package:online_shop_app/widgets/myappBar.dart';
import 'package:online_shop_app/widgets/searchBar.dart';
import 'package:online_shop_app/widgets/searchContainer.dart';
import 'package:online_shop_app/widgets/shimmerLoading.dart';
import 'package:provider/provider.dart';

import '../data/models/product.dart';
import '../widgets/cart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
   
    var productList = context.watch<GetProductController>().products;
  
    return Scaffold(
      drawer: MyDrawer(),
      appBar: myAppbar(title: MyText.cosmetic_app, actions: [Cart()]),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: 360.w,
              height: 200.h,
              color: MyColors.primary,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 360.w,
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
                children: [
                  //search bar
                  // SearchBar(),
                 SearchContainer(productList: productList,),
                  SizedBox(
                    height: 10.h,
                  ),
                  Consumer<GetProductController>(
                    builder: (context, value, _) {
                      List<Product> products = value.products;
                      var loading = value.isLoading;
                      if (loading) {
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: ((context, index) {
                                return ShimmerLoading();
                              })),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return HomeCardWidget(product: products[index]);
                            }),
                      );
                      
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
