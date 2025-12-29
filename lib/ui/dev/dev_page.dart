import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/routing/app_router.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_app_bar.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';

class DevPage extends StatelessWidget {
  const DevPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              spacing: 15,
              children: [
                for (final page in AppRouter.pages)
                  _buildPageButton(
                    page.name,
                    onPressed: () => Get.toNamed(page.name),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageButton(String label, {required void Function() onPressed}) {
    if (label == Routes.dev) {
      return SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: CustomButton.primary(
        onPressed: onPressed,
        label: Text(label),
      ),
    );
  }
}
