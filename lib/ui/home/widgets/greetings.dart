import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  const Greetings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bem vindo!',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Theme.of(context).colorScheme.onTertiaryFixed,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
