import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/product_add_controller.dart';

class ProductAddPage extends GetView<ProductAddController> {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductAddPage'),
      ),
      body: Container(),
    );
  }
}
