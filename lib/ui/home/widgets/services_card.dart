import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';
import 'package:meu_estoque/domain/extensions/services_extensions.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  final ServicesEnum service;
  final void Function(ServicesEnum service) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => onTap(service),
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(16),
              child: Icon(
                service.icon,
                size: 28,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
            Text(
              service.label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
