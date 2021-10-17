import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storage = FlutterSecureStorage();

    Future.delayed(Duration(seconds: 2), () async {
      final token = await storage.read(key: 'jwtToken');

      if (token != null) {
        Get.offAllNamed('/products');
      } else {
        Get.offAllNamed('/login');
      }
    });

    return Scaffold(
      body: Center(
        child: Container(
          child: const Text('Splash Screen'),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
