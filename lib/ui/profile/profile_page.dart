import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/profile_options_enum.dart';
import 'package:meu_estoque/ui/profile/widgets/profile_header.dart';
import 'package:meu_estoque/ui/profile/widgets/profile_option_card.dart';
import 'viewmodel/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(theme: theme),
            const SizedBox(height: 30),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ProfileOptionsEnum.values.length,
              itemBuilder: (context, index) {
                final profileOption = ProfileOptionsEnum.values[index];
                return ProfileOptionCard(
                  theme: theme,
                  profileOption: profileOption,
                  onTap: (profileOption) {
                    Get.toNamed(profileOption.route);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
