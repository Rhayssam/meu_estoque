import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:validatorless/validatorless.dart';
import 'viewmodel/profile_info_controller.dart';

class ProfileInfoPage extends GetView<ProfileInfoController> {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar.primary(
            title: Text(
              'Meu Perfil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: AppBarBackButton(onPressed: Get.back),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.all(20),
            sliver: SliverToBoxAdapter(
              child: Form(
                child: Column(
                  spacing: 18,
                  children: [
                    Text(
                      'Informações pessoais',
                      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text('Nome', style: theme.textTheme.bodyLarge),
                      ),
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('E-mail', style: theme.textTheme.bodyLarge),
                      ),
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text('Telefone', style: theme.textTheme.bodyLarge),
                      ),
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        label: Text('Senha', style: theme.textTheme.bodyLarge),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton.primary(
                      onPressed: () {},
                      label: Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
