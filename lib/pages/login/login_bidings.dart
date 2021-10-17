import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:product_crud/pages/login/login_controller.dart';
import 'package:product_crud/shared/dio/dio_factory.dart';

class LoginBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(FlutterSecureStorage());
    Get.put(DioFactory.createDio());
    Get.put(LoginController(Get.find(), Get.find()));
  }
}
