import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/custom_dialog.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.title,
    required this.content,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String title;
  final String content;
  final String buttonLabel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomDialog(
      icon: Icon(
        CupertinoIcons.exclamationmark_triangle,
        size: 60,
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        Expanded(
          child: CustomButton.alert(
            onPressed: onPressed,
            label: Text(buttonLabel),
          ),
        ),
      ],
    );
  }
}
