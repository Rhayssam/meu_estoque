import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import './auth_option_controller.dart';

class AuthOptionPage extends GetView<AuthOptionController> {
  const AuthOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton.primary(
                    onPressed: () {},
                    label: Text('Entrar com senha do dispositivo'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: CustomButton.secondary(
                    onPressed: () {},
                    label: Text('Entrar com senha do app'),
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
