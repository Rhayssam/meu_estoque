import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/auth/register/viewmodel/register_controller.dart';

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
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text('Confirmar E-mail', style: Theme.of(context).textTheme.bodyLarge),
            ),
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
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Telefone', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
