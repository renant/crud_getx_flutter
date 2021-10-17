import 'package:get/get.dart';

import 'package:product_crud/shared/dio/dio_factory.dart';

import 'product_controller.dart';

class ProductBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(DioFactory.createDio());
    Get.lazyPut(() => ProductController(Get.find()));
  }
}
