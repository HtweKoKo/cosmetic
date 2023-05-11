import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/data/repositary/getProductRepo.dart';

class GetProductController extends ChangeNotifier {
  GetProductRepo _getProductRepo = GetProductRepo();

  List<Product> products = [];
  List<Product> searchedProducts = [];
  bool isLoading = true;

  getProductData() async {
    try {
      isLoading = true;
      var productData = await _getProductRepo.getProduct();

      products = productData;
      notifyListeners();
      return products;
    } finally {
      isLoading = false;
    }
  }

  searchProducts(List<Product> MakeupProduct, String keyWords) {
    if (keyWords.isNotEmpty) {
      var data = MakeupProduct.where((products) =>
              products.name!.toLowerCase().contains(keyWords.toLowerCase()))
          .toList();
      searchedProducts = data;
      print(searchedProducts.length);
    }

    notifyListeners();
  }

  
}
