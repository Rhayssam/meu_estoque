import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/copyright/copyright.dart';
import 'viewmodel/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: [
            CustomSliverAppBar.surface(
              leading: AppBarBackButton(onPressed: Get.back),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Criar Conta',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Nome', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Confirmar E-mail', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Telefone', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverFillRemaining(
                child: Column(
                  spacing: 20,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton.primary(
                        onPressed: () {},
                        label: Text('Avançar'),
                      ),
                    ),
                    Copyright(),
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
