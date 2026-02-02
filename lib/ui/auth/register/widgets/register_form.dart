import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/auth/register/viewmodel/register_controller.dart';
import 'package:meu_estoque/utils/formatter/input_formatters.dart';
import 'package:validatorless/validatorless.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required RegisterController controller,
  }) : _controller = controller;

  final RegisterController _controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formState,
      child: Column(
        spacing: 20,
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text('Nome', style: Theme.of(context).textTheme.bodyLarge),
            ),
            keyboardType: TextInputType.name,
            validator: Validatorless.multiple([
              Validatorless.required('Nome obrigatório'),
              Validatorless.email('Nome inválido'),
            ]),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: Validatorless.multiple([
              Validatorless.required('E-mail obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Confirmar E-mail', style: Theme.of(context).textTheme.bodyLarge),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: Validatorless.multiple([
              Validatorless.required('E-mail obrigatório'),
              Validatorless.email('E-mail inválido'),
            ]),
          ),
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 80),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('DDI', style: Theme.of(context).textTheme.bodyLarge),
                    enabled: false,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  inputFormatters: [
                    InputFormatters.phoneFormatter,
                  ],
                  decoration: InputDecoration(
                    label: Text('Telefone', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: Validatorless.multiple([
                    Validatorless.required('Telefone obrigatório'),
                    Validatorless.email('Telefone inválido'),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
