import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'animated_scroll_fab_controller.dart';

class AnimatedScrollFab extends StatelessWidget {
  const AnimatedScrollFab({
    super.key,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.scrollController,
    required this.onPressed,
    this.durationMilliseconds = 300,
    this.scrollThreshold = 30,
    this.buttonHeight = 56,
  });

  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final ScrollController scrollController;
  final void Function(ScrollController scrollController) onPressed;
  final int durationMilliseconds;
  final int scrollThreshold;
  final double buttonHeight;

  final double buttonHorizontalPadding = 16;

  AnimatedScrollFabController get controller {
    if (Get.isRegistered<AnimatedScrollFabController>()) {
      return Get.find<AnimatedScrollFabController>();
    }

    return Get.put(
      AnimatedScrollFabController(
        scrollController: scrollController,
        durationMilliseconds: durationMilliseconds,
        scrollThreshold: scrollThreshold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final double buttonWidth = _calcButtonWidth(context, label);
    controller.setUpAnimation(buttonWidth);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: controller.sizeAnimation,
        builder: (context, child) {
          return _buildScrollFabButton(controller, theme);
        },
      ),
    );
  }

  double _calcButtonWidth(BuildContext context, String text) {
    final TextPainter painter = TextPainter(
      text: TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: textColor,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return painter.width + buttonHorizontalPadding + buttonHeight;
  }

  Widget _buildScrollFabButton(
    AnimatedScrollFabController controller,
    ThemeData theme,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: () => onPressed(controller.scrollController),
          child: SizedBox(
            height: buttonHeight,
            width: controller.buttonCurrentWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: buttonHorizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: controller.isDismissed,
                    child: Text(
                      label,
                      maxLines: 1,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: textColor,
                      ),
                    ),
                  ),
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
