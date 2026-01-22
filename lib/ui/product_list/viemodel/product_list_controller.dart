import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';

class ProductListController extends GetxController {
  final fabScrollController = ScrollController();
  Future<void> goToProductAddPage() async {
    await Get.toNamed(Routes.productAdd);
  }
}
