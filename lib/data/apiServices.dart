import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_shop_app/RequestType.dart';
import 'package:online_shop_app/data/models/product.dart';

class ApiService{
 static const String BASE_URL = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

      Dio dio = Dio();
      Future request(
      {required String uriString,
      required RequestType requestType,
      Map<String, String>? header,
      dynamic body}) async {
    switch (requestType) {
      case RequestType.Get:
        return dio.get(uriString);

      case RequestType.Post:
        // TODO: Handle this case.
        break;
    }
  }
 Future<List<Product>> getProduct()async{
        var data = await dio.get(BASE_URL);
       var linkData = data.data as List;
       var products = linkData.map((e) => Product.fromJson(e)).toList();
       return products;
  }

}