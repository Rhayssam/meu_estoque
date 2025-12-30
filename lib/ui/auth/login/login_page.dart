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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginForm(
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
