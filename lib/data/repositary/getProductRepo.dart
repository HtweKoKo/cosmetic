import 'dart:convert';

import 'package:get/get.dart';
import 'package:online_shop_app/data/apiServices.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/util/api.dart';

import '../../RequestType.dart';

class GetProductRepo {
  static const String BASE_URL =
      "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

  ApiService apiService = ApiService();

  Future<List<Product>> getProduct() async {
    var getData = await apiService.request(
        uriString: BASE_URL, requestType: RequestType.Get);
    var listData = getData.data as List;

    var result = listData.map((e) => Product.fromJson(e)).toList();

    return result;
  }
}
