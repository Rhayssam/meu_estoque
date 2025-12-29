import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoubleClickToExit extends StatelessWidget {
  const DoubleClickToExit({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    DateTime? timeBackPressed;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }

        final isLastRoute = ModalRoute.of(context)?.isFirst ?? false;

        if (!isLastRoute) {
          Navigator.of(context).pop();
          return;
        }

        final now = DateTime.now();

        if (timeBackPressed == null || now.difference(timeBackPressed!).inSeconds > 1.5) {
          timeBackPressed = now;

          Fluttertoast.showToast(
            msg: 'Pressione novamente para sair',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
          return;
        }

        await Fluttertoast.cancel();
        SystemNavigator.pop();
      },
      child: child,
    );
  }
}
