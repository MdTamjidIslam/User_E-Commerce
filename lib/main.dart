
import 'package:ecom_user_app/page/cart_page.dart';
import 'package:ecom_user_app/page/checkout_page.dart';
import 'package:ecom_user_app/page/phone_verification_page.dart';
import 'package:ecom_user_app/page/registration_page.dart';
import 'package:ecom_user_app/page/user_address_page.dart';
import 'package:ecom_user_app/providers/cart_provider.dart';
import 'package:ecom_user_app/providers/order_provider.dart';
import 'package:ecom_user_app/providers/product_provider.dart';
import 'package:ecom_user_app/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'page/launcher_page.dart';
import 'page/login_page.dart';
import 'page/order_page.dart';
import 'page/product_details_page.dart';
import 'page/product_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>ProductProvider()),
      ChangeNotifierProvider(create: (context)=>OrderProvider()),
      ChangeNotifierProvider(create: (context)=> UserProvider()),
      ChangeNotifierProvider(create: (context)=> CartProvider()),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (_) => const LauncherPage(),
        LoginPage.routeName: (_) => const LoginPage(),
        ProductPage.routeName: (_) =>  ProductPage(),
        ProductDetailsPage.routeName: (_) => ProductDetailsPage(),
        OrderPage.routeName: (_) => const OrderPage(),
        PhoneVerificationPage.routeName:(_)=>PhoneVerificationPage(),
        RegistrationPage.routeName:(_)=>RegistrationPage(),
        CartPage.routeName:(_)=>CartPage(),
        UserAddressPage.routeName:(_)=>UserAddressPage(),
        CheckoutPage.routeName:(_)=>CheckoutPage(),
      },
    );
  }
}

