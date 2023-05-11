import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:online_shop_app/data/models/product.dart';
part 'cartData.g.dart';

@HiveType(typeId: 1)
class CartData {
  CartData({
    required this.count,
    this.key = 0,
    required this.id,
    required this.rating,
    required this.brand,
    required this.name,
    required this.price,
    required this.image_link,
    required this.description,
    required this.product_type,
  });
  @HiveField(0)
  int id;
  @HiveField(1)
  double rating;
  @HiveField(2)
  String brand;
  @HiveField(3)
  String name;
  @HiveField(4)
  String price;
  @HiveField(5)
  String image_link;
  @HiveField(6)
  String description;
  @HiveField(7)
  String product_type;
  @HiveField(8)
  int key;
  @HiveField(9)
  int count;
 
}





//  int? id;
//   double? rating;
//   String? brand,
//       name,
//       price,
//       image_link,
//       description,
//       product_type,
//       product_api_url;