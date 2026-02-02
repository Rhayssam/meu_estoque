import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/auth/register/widgets/register_form.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/copyright/copyright.dart';
import 'viewmodel/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  RegisterController get _controller => Get.find<RegisterController>();

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
                child: RegisterForm(controller: _controller),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 20,
                  children: [
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton.primary(
                        onPressed: () {},
                        label: const Text('Avançar'),
                      ),
                    ),
                    const Copyright(),
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
