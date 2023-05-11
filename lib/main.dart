import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop_app/controllers/buyNowController.dart';
import 'package:online_shop_app/controllers/getProductController.dart';
import 'package:online_shop_app/controllers/netWorkCheckController.dart';
import 'package:online_shop_app/controllers/yourCartController.dart';
import 'package:online_shop_app/data/models/cartData.dart';
import 'package:online_shop_app/pages/your_cart.dart';
import 'package:provider/provider.dart';

import 'pages/Splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartDataAdapter());

  Box cartbox = await Hive.openBox("cartData");

//cartbox.clear();
    print(cartbox.length);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<NetWorkCheckController>(
          create: (_) => NetWorkCheckController()),
            ChangeNotifierProvider<GetProductController>(
          create: (_) => GetProductController()),
           ChangeNotifierProvider<YourCartController>(
          create: (_) => YourCartController()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
