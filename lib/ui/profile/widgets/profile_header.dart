import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
