import 'package:flutter/material.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Rhayssam © 2026',
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontStyle: FontStyle.italic,
        color: Theme.of(context).colorScheme.primaryFixed.withValues(
          alpha: .5,
        ),
      ),
    );
  }
}
