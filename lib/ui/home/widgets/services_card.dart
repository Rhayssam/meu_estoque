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
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(22)),
      onTap: () => onTap(service),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(22)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  color: Theme.of(context).colorScheme.onPrimary,
                  service.icon,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                service.label,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
