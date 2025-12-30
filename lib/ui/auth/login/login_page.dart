import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/auth/login/login_controller.dart';
import 'package:meu_estoque/ui/auth/login/login_form.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  LoginController get _controller => Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return DoubleClickToExit(
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Informe seu E-mail e Senha para continuar',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const SizedBox(height: 15),
                      LoginForm(controller: _controller),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Spacer(),
                        Divider(
                          height: 40,
                          color: Theme.of(context).colorScheme.primaryFixed,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await _controller.login();
                            },
                            icon: Icon(Icons.login),
                            label: Text('LOGIN'),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
