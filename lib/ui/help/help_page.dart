import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/help_controller.dart';

class HelpPage extends GetView<HelpController> {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelpPage'),
      ),
      body: Container(),
    );
  }
}
