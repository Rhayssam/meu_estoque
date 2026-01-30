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
                            'Bem vindo de volta!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 15),
                        LoginForm(controller: _controller),
                        Spacer(),
                        Column(
                          spacing: 10,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: CustomButton.primary(
                                onPressed: () async {
                                  await _controller.login();
                                },
                                icon: Icon(Icons.login),
                                label: Text('Login'),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 15.0),
                                    child: Divider(
                                      height: 40,
                                      color: Theme.of(context).colorScheme.primaryFixed,
                                    ),
                                  ),
                                ),
                                Text('ou'),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: Divider(
                                      height: 40,
                                      color: Theme.of(context).colorScheme.primaryFixed,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: _controller.goToRegisterPage,
                              child: Text(
                                'Criar uma conta',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
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
