import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/splash/viewmodel/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth * 0.20;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: ClipRect(
            child: AnimatedBuilder(
              animation: controller.revealAnimation,
              builder: (_, _) {
                return Align(
                  alignment: Alignment.center,
                  heightFactor: controller.revealAnimation.value,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 15,
                      children: [
                        CircleAvatar(
                          radius: avatarRadius,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.sentiment_satisfied_outlined,
                            size: avatarRadius,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          'Bem vindo(a)!',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
