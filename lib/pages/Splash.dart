import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_shop_app/controllers/netWorkCheckController.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/networkService/internetchecker.dart';
import 'package:online_shop_app/pages/home.dart';
import 'package:online_shop_app/pages/your_cart.dart';
import 'package:provider/provider.dart';

import '../controllers/getProductController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    super.initState();
    context.read<NetWorkCheckController>().getConnect();
    context.read<YourCartController>().getCartData();
    context.read<GetProductController>().getProductData();

  }

  @override
  Widget build(BuildContext context) {
      nextPage();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Consumer<NetWorkCheckController>(
            builder: (BuildContext context, value, _) {
              print(value.isconnect);
              if (value.isconnect) {
              
              } else {
                Fluttertoast.showToast(
                    backgroundColor: Colors.white,
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 16,
                    textColor: Colors.black,
                    msg: value.connectState);
              }
    
              return SizedBox();
            },
          ),
          width: 360.w,
          height: 640.h,
          
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/cosmetic_splash.png",
                  ),
                  fit: BoxFit.fill)),
        ),
      ),
    );
  }

  void nextPage() async {
    await Future.delayed(Duration(seconds:3));
    Navigator.pushReplacement(context, 
    MaterialPageRoute(builder: (context)=>Home())
    );
  }
}
