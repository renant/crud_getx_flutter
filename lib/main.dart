import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:product_crud/pages/login/login_bidings.dart';
import 'package:product_crud/pages/login/login_page.dart';
import 'package:product_crud/pages/product/product_bidings.dart';
import 'package:product_crud/pages/product/product_page.dart';
import 'package:product_crud/pages/products/products_bidings.dart';
import 'package:product_crud/pages/products/products_page.dart';
import 'package:product_crud/pages/splashscreen/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScren(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBidings(),
        ),
        GetPage(
          name: '/products',
          page: () => const ProductsPage(),
          binding: ProductsBidings(),
        ),
        GetPage(
          name: '/product',
          page: () => const ProductPage(),
          binding: ProductBidings(),
        ),
      ],
    );
  }
}
