import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_multi_formatter/formatters/formatter_extension_methods.dart';
import 'package:get/get.dart';
import 'package:product_crud/models/product.dart';

class ProductController extends GetxController {
  final Dio _dio;

  ProductController(this._dio);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  var product = Product.empty();

  var isEdit = false.obs;

  @override
  void onInit() async {
    super.onInit();

    if (Get.arguments?['id'] != null) {
      isEdit.value = true;
      await getProduct(Get.arguments?['id']);
    }
  }

  Future<void> getProduct(int parameter) async {
    try {
      final response = await _dio.get('/products/$parameter');
      product = Product.fromMap(response.data);

      nameController.text = product.name;
      priceController.text =
          product.price.toCurrencyString(leadingSymbol: 'R\$ ');
      descriptionController.text = product.description;
    } on DioError catch (e) {
      Get.snackbar(
        'Erro',
        e.response!.data.toString(),
      );
    }
  }

  save() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        if (isEdit.value) {
          await _dio.put('/products/${product.id}', data: product.toMap());
        } else {
          await _dio.post('/products', data: product.toMap());
        }
        Get.offAllNamed('/products');
      } on DioError catch (e) {
        Get.snackbar(
          'Erro',
          e.response!.data.toString(),
        );
      }
    }
  }
}
