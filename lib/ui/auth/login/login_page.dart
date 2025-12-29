import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DoubleClickToExit(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 20,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Login'),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('Senha'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
