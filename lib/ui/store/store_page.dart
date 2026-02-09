import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/store_controller.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StorePage'),
      ),
      body: Text('Store'),
    );
  }
}
