import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './auth_option_controller.dart';

class AuthOptionPage extends GetView<AuthOptionController> {
  const AuthOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthOptionPage'),
      ),
      body: Container(),
    );
  }
}
