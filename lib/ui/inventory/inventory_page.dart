import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './inventory_controller.dart';

class InventoryPage extends GetView<InventoryController> {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InventoryPage'),
      ),
      body: Container(),
    );
  }
}
