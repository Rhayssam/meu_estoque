import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/relatory_controller.dart';

class RelatoryPage extends GetView<RelatoryController> {
  const RelatoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RelatoryPage'),
      ),
      body: Text('Relatory'),
    );
  }
}
