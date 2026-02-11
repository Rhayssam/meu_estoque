import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/profile_options_enum.dart';

class ProfileOptionCard extends StatelessWidget {
  const ProfileOptionCard({
    super.key,
    required this.theme,
    required this.profileOption,
    required this.onTap,
  });

  final ProfileOptionsEnum profileOption;
  final ThemeData theme;
  final void Function(ProfileOptionsEnum profileOption) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.colorScheme.secondary,
      child: InkWell(
        onTap: () => onTap(profileOption),
        child: Container(
          padding: EdgeInsets.all(18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                profileOption.label,
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
    );
  }
}
