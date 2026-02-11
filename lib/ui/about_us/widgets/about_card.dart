import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({
    super.key,
    required this.title,
    required this.contents,
  });

  final String title;
  final List<String> contents;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(10),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            thickness: 0.3,
            color: theme.colorScheme.primaryFixed,
          ),
          ...contents.map(
            (text) => _contentParagraph(theme, text),
          ),
        ],
      ),
    );
  }

  Widget _contentParagraph(ThemeData theme, String text) {
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}
