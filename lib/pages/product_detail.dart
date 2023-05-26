import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:online_shop_app/constant/helpers/my_colors.dart';
import 'package:online_shop_app/constant/helpers/my_text.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/pages/buy_now.dart';
import 'package:online_shop_app/widgets/myDrawer.dart';
import 'package:online_shop_app/widgets/cart.dart';
import 'package:online_shop_app/widgets/myappBar.dart';
import 'package:online_shop_app/widgets/ratingWidget.dart';
import 'package:provider/provider.dart';

import '../data/models/cartData.dart';
import '../data/models/product.dart';

class ProductDetail extends StatefulWidget {
  Product? product;

  ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(this.product);
}

class _ProductDetailState extends State<ProductDetail> {
  Product? product;
  _ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    var counts = 1;
    var initialcount = 1;

    var cartItem = context.watch<YourCartController>().listItem;
    return Scaffold(
      backgroundColor: MyColors.secondy,
      appBar: myAppbar(title: MyText.details, actions: [Cart()]),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox()),
              Container(
                width: 360.w,
                height: 350.h,
                color: MyColors.primary,
              ),
            ],
          ),
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 160.h,
                  ),
                  Container(
                    width: 360.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.sp),
                            topRight: Radius.circular(30.sp))),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    imageContainer(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            "${product!.name}",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: MyColors.normal,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "\$ ${product!.price}",
                          style: TextStyle(
                              color: MyColors.normal,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${product!.product_type}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MyColors.hint,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400)),
                        RatingWidget(rating: product!.rating ?? 0.0)
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        height: 149.w,
                        child: Text(
                          "${product!.description}",
                          style: TextStyle(
                              color: MyColors.normal, fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40.h,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.secondy,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BuyNow(product: product!)));
                                },
                                child: Text(
                                  MyText.buy_now,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.accent,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 40.h,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: MyColors.secondy,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: IconButton(
                            onPressed: () {
                              print(" button");
                              var data = cartItem.map((e) {
                                if (e.id == product!.id) {
                                  return true;
                                }
                              }).toList();

                              var aa = data.contains(true);
                              print(aa);
                              if (aa) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("added")));
                              } else {
                                context.read<YourCartController>().addCartData(
                                    CartData(
                                        count: 1,
                                        brand: product?.brand ?? "",
                                        name: product?.name ?? "",
                                        id: product!.id ?? 0,
                                        rating: product!.rating ?? 0.0,
                                        price: product!.price ?? "",
                                        product_type:
                                            product!.product_type ?? "",
                                        image_link: product!.image_link ?? "",
                                        description:
                                            product!.description ?? ""));
                              }
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: MyColors.accent,
                              size: 20.sp,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget imageContainer() {
    return Center(
      child: SizedBox(
        width: 250.w,
        height: 250.w,
        child: Container(
          width: 250.w,
          height: 250.w,
          decoration: BoxDecoration(
            color: MyColors.normal,
            borderRadius: BorderRadius.circular(20.sp),
            image: DecorationImage(
                image: NetworkImage(product!.image_link.toString()),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

//  var keydata = cartItem.map((e) {
//                                 if (e.id.isEqual(product!.id ?? 0)) {
//                                   return e.key;
//                                 }
//                               }).toList();
//                               keydata.removeWhere((element) => 
//                               element == null
//                               );

                            
//                            print("hello $keydata");
//  context.read<YourCartController>().increaseCount();

//                                 cartBox.put(keydata[0],
//                                  CartData(
                            
//                                       count:context.read<YourCartController>().count++,
//                                       brand: product?.brand ?? "",
//                                       name: product?.name ?? "",
//                                       id: product!.id ?? 0,
//                                       rating: product!.rating ?? 0.0,
//                                       price: product!.price ?? "",
//                                       product_type: product!.product_type ?? "",
//                                       image_link: product!.image_link ?? "",
//                                       description: product!.description ?? "")
//                                 );
