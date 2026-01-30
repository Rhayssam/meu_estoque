import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/services/loading_overlay_manager.dart';
import 'package:meu_estoque/ui/core/widgets/loaders/loading.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx(
          () {
            final bool isLoading = LoadingOverlayManager.instance.isLoading;

            return Positioned.fill(
              child: IgnorePointer(
                ignoring: !isLoading,
                child: AnimatedOpacity(
                  opacity: isLoading ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Container(
                    color: Colors.black38,
                    child: const Loading(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
