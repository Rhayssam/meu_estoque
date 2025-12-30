import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button_styles.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/custom_dialog.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.onConfirm,
    required this.onCancel,
    this.isAlert = false,
  });

  final String title;
  final String content;
  final String confirmLabel;
  final String cancelLabel;
  final bool? isAlert;
  final void Function() onConfirm;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomDialog(
      icon: Icon(
        CupertinoIcons.question_circle,
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
      actionsSpacing: 20,
      actions: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            child: Text(cancelLabel),
          ),
        ),
        Expanded(
          child: CustomButton(
            style: (isAlert ?? false) ? theme.alertButtonStyle : theme.primaryButtonStyle,
            onPressed: onConfirm,
            label: Text(confirmLabel),
          ),
        ),
      ],
    );
  }
}
