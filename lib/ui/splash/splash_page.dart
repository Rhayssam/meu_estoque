import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/splash/viewmodel/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final avatarRadius = screenWidth * 0.20;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
