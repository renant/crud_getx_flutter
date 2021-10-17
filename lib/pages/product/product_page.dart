import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:product_crud/pages/product/product_controller.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() =>
            Text(controller.isEdit.value ? 'Edit Product' : 'New Product')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                  },
                  onSaved: (value) => controller.product.name = value ?? '',
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  controller: controller.priceController,
                  inputFormatters: [
                    MoneyInputFormatter(
                      leadingSymbol: 'R\$ ',
                    )
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Price is required';
                    }
                  },
                  onSaved: (value) => controller.product.price =
                      num.tryParse((value ?? '').replaceAll('R\$ ', '')) ?? 0,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: null,
                  controller: controller.descriptionController,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Description is required';
                    }
                  },
                  onSaved: (value) =>
                      controller.product.description = value ?? '',
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.save();
                    },
                    child: const Text('Save')),
              ],
            )),
      ),
    );
  }
}
