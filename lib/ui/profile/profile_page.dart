import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: theme.colorScheme.secondary),
              child: Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: 28,
                  ),
                  Column(
                    spacing: 4,
                    children: [
                      Text(
                        'Bem-vindo, usuário',
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          Icon(
                            Icons.email,
                            color: theme.colorScheme.primary,
                            size: 15,
                          ),
                          Text(
                            'emaillegal@email.com',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Material(
              color: theme.colorScheme.secondary,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meu Perfil',
                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
