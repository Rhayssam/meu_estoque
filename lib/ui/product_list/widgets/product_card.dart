import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryFixed,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 100,
              width: 100,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome do Produto',
              style: theme.textTheme.titleMedium,
            ),
            Text(
              'Descrição do Produto',
              style: theme.textTheme.titleSmall,
              maxLines: 2,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'R\$0,00 ',
                    style: theme.textTheme.titleMedium,
                  ),
                  TextSpan(
                    text: 'a vista',
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Text(
              'ou 10x de R\$0,00',
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
