import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar.surface(
            title: Text('Produtos'),
            leading: AppBarBackButton(onPressed: Get.back),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text('data'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
