import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/core/widgets/fab/animated_scroll_fab.dart';
import 'package:meu_estoque/ui/product_list/viemodel/product_list_controller.dart';
import 'package:meu_estoque/ui/product_list/widgets/product_card.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});
  ProductListController get _controller => Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: AnimatedScrollFab(
        icon: Icons.add,
        label: 'Cadastrar produto',
        backgroundColor: theme.colorScheme.onSurface,
        iconColor: theme.colorScheme.surface,
        textColor: theme.colorScheme.surface,
        scrollController: _controller.fabScrollController,
        onPressed: (_) {
          _controller.goToProductAddPage();
        },
      ),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar.surface(
            title: Text('Produtos'),
            leading: AppBarBackButton(onPressed: Get.back),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.all(20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Meus Produtos',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemCount: 5,
              separatorBuilder: (_, _) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
