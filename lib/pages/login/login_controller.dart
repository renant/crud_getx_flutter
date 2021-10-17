import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final Dio _dio;
  final FlutterSecureStorage _storage;

  var email = '';
  var password = '';

  final formKey = GlobalKey<FormState>();

  LoginController(this._dio, this._storage);

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        final response = await _dio
            .post('/login', data: {"email": email, "password": password});

        _storage.write(key: 'jwtToken', value: response.data['accessToken']);

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
