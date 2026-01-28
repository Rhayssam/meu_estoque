import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './auth_option_controller.dart';

class AuthOptionPage extends GetView<AuthOptionController> {
  const AuthOptionPage({super.key});

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
                  Icons.person,
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
