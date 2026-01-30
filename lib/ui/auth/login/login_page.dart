import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/auth/login/viewmodel/login_controller.dart';
import 'package:meu_estoque/ui/auth/login/widgets/login_form.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/copyright/copyright.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';
import 'package:meu_estoque/ui/core/widgets/loaders/loading_overlay.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  LoginController get _controller => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return DoubleClickToExit(
      child: LoadingOverlay(
        child: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: ScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text(
                          'MeuEstoque App',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Informe seu E-mail e Senha para continuar',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const SizedBox(height: 15),
                        LoginForm(controller: _controller),
                        Container(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueci minha senha',
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Column(
                          spacing: 10,
                          children: [
                            Divider(
                              height: 40,
                              color: Theme.of(context).colorScheme.primaryFixed,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomButton.primary(
                                onPressed: () async {
                                  await _controller.login();
                                },
                                icon: Icon(Icons.login),
                                label: Text('LOGIN'),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'CRIAR CONTA',
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Copyright(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
