import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/auth/login/viewmodel/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required LoginController controller,
  }) : _controller = controller;

  final LoginController _controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _controller.emailEC,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
            ),
            validator: Validatorless.multiple([
              Validatorless.required('E-mail Obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Esqueceu a senha?',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Obx(
            () {
              return TextFormField(
                controller: _controller.passwordEC,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onEditingComplete: _controller.login,
                decoration: InputDecoration(
                  label: Text(
                    'Senha',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _controller.changePasswordVisibility(),
                    icon: _controller.viewPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  ),
                ),
                validator: Validatorless.required('Senha obrigatória'),
                obscureText: _controller.viewPassword,
              );
            },
          ),
          Row(
            children: [
              Obx(() {
                return Checkbox(
                  value: _controller.keepSigned,
                  onChanged: _controller.setKeepSigned,
                );
              }),
              Text('Mantenha-me conectado'),
            ],
          ),
        ],
      ),
    );
  }
}
