import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'viewmodel/product_add_controller.dart';

class ProductAddPage extends GetView<ProductAddController> {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar.surface(
              title: Text('Adicionar Produto'),
              leading: AppBarBackButton(onPressed: Get.back),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.all(20),
              sliver: SliverToBoxAdapter(
                child: Text('Preencha todas as informações do produto que será cadastrado'),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Divider(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 15,
                  children: [
                    Text(
                      '1 - Informações Gerais',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Nome'),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Categoria'),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Descrição'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
