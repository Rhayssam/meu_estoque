import 'package:flutter/material.dart';

class DrawerOption extends StatelessWidget {
  const DrawerOption({super.key, required this.title, required this.icon, required this.onTap});

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryFixed),
      ),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: Icon(icon),
      ),
      onTap: onTap,
    );
  }
}
