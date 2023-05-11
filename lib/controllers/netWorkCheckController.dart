import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../networkService/internetchecker.dart';

class NetWorkCheckController extends ChangeNotifier {
  final NetWorkConnectivityChecker _netWorkConnectivityChecker =
      NetWorkConnectivityChecker.instance;
  String connectState = "";
  bool isconnect = true;
  

  void getConnect() async {
    print("call");
    var aa = await _netWorkConnectivityChecker.initial();
    switch (aa) {
      case ConnectivityResult.bluetooth:
        connectState = "bluetooth";
        isconnect = true;
        break;
      case ConnectivityResult.wifi:
        connectState = "wifi";
        isconnect = true;

        break;
      case ConnectivityResult.ethernet:
        connectState = "ethernet";
        isconnect = true;

        break;
      case ConnectivityResult.mobile:
        connectState = "mobile";
        isconnect = true;

        break;

      case ConnectivityResult.vpn:
        connectState = "vpn";
        isconnect = true;

        break;
      case ConnectivityResult.other:
        connectState = "other";
        isconnect = true;

        break;
      case ConnectivityResult.none:
        connectState = "no internet connection";
        isconnect = false;

        break;
      default:
        connectState = "something was Wrong";
        isconnect = false;
    }
    notifyListeners();
  }

  void disposeState() {
    _netWorkConnectivityChecker.disposeStream();
  }
}
