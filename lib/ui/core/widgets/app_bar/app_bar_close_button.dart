import 'package:flutter/material.dart';

class AppBarCloseButton extends StatelessWidget {
  const AppBarCloseButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.close),
    );
  }
}
