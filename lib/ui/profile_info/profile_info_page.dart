import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/profile_info_controller.dart';

class ProfileInfoPage extends GetView<ProfileInfoController> {
  const ProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileInfoPage'),
      ),
      body: Container(),
    );
  }
}
