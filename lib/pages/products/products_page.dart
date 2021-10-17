import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'products_controller.dart';
import 'package:flutter_multi_formatter/formatters/formatter_extension_methods.dart';

class ProductsPage extends GetView<ProductsController> {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductsPage'),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => controller.loadProducts(),
          key: controller.refreshkey,
          child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (_, index) {
              final product = controller.products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name),
                        Text(product.price
                            .toCurrencyString(leadingSymbol: 'R\$')),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => {
                        Get.toNamed('/product', arguments: {'id': product.id})
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Get.toNamed('/product'),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
