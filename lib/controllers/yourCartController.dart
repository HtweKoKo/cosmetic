import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:online_shop_app/data/models/cartData.dart';

import '../data/models/product.dart';

class YourCartController extends ChangeNotifier {
  var cartBox = Hive.box("cartData");

  List<CartData> listItem = [];
  int count = 1;

  void getCartData() {
    var data = cartBox.keys.map(
      (key) {
        CartData item = cartBox.get(key);

        return CartData(
            count: item.count,
            key: key,
            id: item.id,
            brand: item.brand,
            name: item.name,
            rating: item.rating,
            description: item.description,
            price: item.price,
            image_link: item.image_link,
            product_type: item.product_type);
      },
    ).toList();

    listItem = data.reversed.toList();
  }

  addCartData(CartData cartData) async {
    await cartBox.add(cartData);

    getCartData();
    notifyListeners();
  }

  removeCartCount(CartData cartData) async {
    if (cartData.count != 1) {
      await cartBox.put(
          cartData.key,
          CartData(
              count: cartData.count -= 1,
              id: cartData.id,
              rating: cartData.rating,
              brand: cartData.brand,
              name: cartData.name,
              price: cartData.price,
              image_link: cartData.image_link,
              description: cartData.description,
              product_type: cartData.product_type));
    }
    getCartData();
    notifyListeners();
  }

  addCountItem(CartData cartData) async {
    await cartBox.put(
        cartData.key,
        CartData(
            count: cartData.count += 1,
            id: cartData.id,
            rating: cartData.rating,
            brand: cartData.brand,
            name: cartData.name,
            price: cartData.price,
            image_link: cartData.image_link,
            description: cartData.description,
            product_type: cartData.product_type));
    getCartData();
    notifyListeners();
  }

  deleteSingleProducts(CartData cartData) async {
    await cartBox.delete(cartData.key);
    getCartData();
    notifyListeners();
  }

  getSingleProduct(List<Product> productList, int id) {
    var data = productList.where((m) => m.id!.isEqual(id)).toList();
    notifyListeners();

    return data[0];
  }

  double get totalPrice => listItem.fold(0, ((previousValue, element) {
   
        return previousValue + (double.parse(element.price) * element.count);
      }));
  int get totalItem => listItem.fold(0, ((previousValue, element) {
   
        return previousValue + element.count ;
      }));
}
