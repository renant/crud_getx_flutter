import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_crud/models/product.dart';

class ProductsController extends GetxController {
  final Dio _dio;

  final RxList<Product> products = List<Product>.empty().obs;

  ProductsController(this._dio);

  var refreshkey = GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() async {
    super.onInit();
    await loadProducts();
  }

  Future<void> loadProducts() async {
    try {
      final response = await _dio.get<List>('/products');

      if (response.data != null) {
        products.value =
            response.data!.map((product) => Product.fromMap(product)).toList();
      }
    } on DioError catch (e) {
      Get.snackbar(
        'Erro',
        e.response!.data.toString(),
      );
    }
  }
}
