import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:online_shop_app/data/apiServices.dart';
import 'package:online_shop_app/util/api.dart';

class NetWorkConnectivityChecker {
  NetWorkConnectivityChecker._();
  static final _instance = NetWorkConnectivityChecker._();
  static NetWorkConnectivityChecker get instance => _instance;
  final _netWorkCheck = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get getStream => _controller.stream;

  Future<ConnectivityResult> initial() async {
    print("aa");
    var aa = await _netWorkCheck.checkConnectivity();
    print(aa);
    return aa;
  }
  // void checkStatus (ConnectivityResult result)async{
  //     bool isonline = false;
  //     try{
  //       final result = await InternetAddress.lookup("");
  //       isonline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;

  //     }on SocketException catch(_){
  //         isonline = false;
  //     }
  //     _controller.sink.add({result:isonline});
  // }
  void disposeStream() => _controller.close();
}
