import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.primary(
        leading: AppBarBackButton(
          onPressed: () => Get.back(),
        ),
        title: const Text('HomePage'),
      ),
      body: Column(),
    );
  }
}
