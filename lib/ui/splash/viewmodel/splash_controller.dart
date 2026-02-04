import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> revealAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    revealAnimation = CurvedAnimation(
      parent: animationController,
      // curve: Curves.easeInOut,
      curve: Curves.easeInOutCubic,
    );

    _startFlow();
  }

  Future<void> _startFlow() async {
    await animationController.forward();

    await Future.delayed(const Duration(seconds: 1));

    await animationController.reverse();

    Get.offAllNamed(
      Routes.login,
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
