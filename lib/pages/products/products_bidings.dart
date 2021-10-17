import 'package:get/get.dart';
import 'package:product_crud/pages/products/products_controller.dart';
import 'package:product_crud/shared/dio/dio_factory.dart';

class ProductsBidings implements Bindings {
  @override
  void dependencies() {
    Get.put(DioFactory.createDio());
    Get.lazyPut(() => ProductsController(Get.find()));
  }
}
