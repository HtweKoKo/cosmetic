import 'package:flutter/material.dart';
import 'package:online_shop_app/data/models/cartData.dart';
import 'package:online_shop_app/data/models/product.dart';
import 'package:online_shop_app/pages/add_address.dart';
import 'package:online_shop_app/widgets/addAddressDataWidget.dart';

class BuyNowController with ChangeNotifier {
  var result;
  int count = 1;
  int selected = 1;
   String? totalPrice;
  @override
  getDataFromAddressPage(BuildContext context) async {
    result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddAdderess()));
    notifyListeners();
  }

  increaseCount() {
    count++;

    notifyListeners();
  }

  decreaseCount() {
    if (count != 1) {
      count--;
    }

    notifyListeners();
  }

  selectedPayment() {
    if (selected == 1) {
      selected = 2;
    } else {
      selected = 1;
    }
    notifyListeners();
  }

  singleProductTotalPrice({required double productPrice}) {
      
   totalPrice = (productPrice *count).toStringAsFixed(2);
   return totalPrice;
  }
 
}
