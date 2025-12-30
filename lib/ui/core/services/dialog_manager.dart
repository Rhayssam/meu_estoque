import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/confirm_dialog.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/custom_dialog.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/delete_dialog.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/error_dialog.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/info_dialog.dart';
import 'package:meu_estoque/ui/core/widgets/dialogs/success_dialog.dart';

class DialogManager {
  DialogManager._(BuildContext context) : _context = context;

  final BuildContext _context;

  static DialogManager of(BuildContext context) {
    return DialogManager._(context);
  }

  Future<T?> showCustomDialog<T>({
    bool barrierDismissible = true,
    required Widget title,
    required Widget content,
    required List<Widget> actions,
    Icon? icon,
    double iconBottomMargin = 25,
    double titleBottomMargin = 15,
    double contentBottomMargin = 25,
    double actionsSpacing = 20,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    MainAxisAlignment actionAlignment = MainAxisAlignment.spaceAround,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return CustomDialog(
          title: title,
          actionAlignment: actionAlignment,
          crossAxisAlignment: crossAxisAlignment,
          icon: icon,
          mainAxisAlignment: mainAxisAlignment,
          iconBottomMargin: iconBottomMargin,
          titleBottomMargin: titleBottomMargin,
          contentBottomMargin: contentBottomMargin,
          actionsSpacing: actionsSpacing,
          content: content,
          actions: actions,
        );
      },
    );
  }

  Future<T?> showInfoDialog<T>({
    required String title,
    required String content,
    required String buttonLabel,
    required void Function() onPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return InfoDialog(
          title: title,
          content: content,
          buttonLabel: buttonLabel,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<T?> showConfirmDialog<T>({
    required String title,
    required String content,
    required String confirmLabel,
    required String cancelLabel,
    required void Function() onConfirm,
    required void Function() onCancel,
    bool isAlert = false,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return ConfirmDialog(
          title: title,
          content: content,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          onCancel: onCancel,
          onConfirm: onConfirm,
          isAlert: isAlert,
        );
      },
    );
  }

  Future<T?> showErrorDialog<T>({
    required String title,
    required String content,
    required String buttonLabel,
    required void Function() onPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return ErrorDialog(
          title: title,
          content: content,
          buttonLabel: buttonLabel,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<T?> showSuccessDialog<T>({
    required String title,
    required String content,
    required String buttonLabel,
    required void Function() onPressed,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return SuccessDialog(
          title: title,
          content: content,
          buttonLabel: buttonLabel,
          onPressed: onPressed,
        );
      },
    );
  }

  Future<T?> showDeleteDialog<T>({
    required String title,
    required String content,
    required String confirmLabel,
    required String cancelLabel,
    required void Function() onConfirm,
    required void Function() onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return DeleteDialog(
          title: title,
          content: content,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          onCancel: onCancel,
          onConfirm: onConfirm,
        );
      },
    );
  }
}
