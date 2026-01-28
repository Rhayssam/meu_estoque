import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/theme/color_scheme_extension.dart';

enum CustomShimmerStyle {
  list,
  card,

  multiple,
}

class CustomShimmer extends StatelessWidget {
  const CustomShimmer.list({
    super.key,
    required this.height,
    this.count = 5,
    this.spacing = 15,
    this.width = double.infinity,
    this.baseColor,
    this.highlightColor,
  }) : style = CustomShimmerStyle.list,
       children = null,
       borderRadius = 10;

  const CustomShimmer.card({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.baseColor,
    this.highlightColor,
  }) : style = CustomShimmerStyle.card,
       count = 1,
       spacing = 0,
       children = null,
       borderRadius = 10;

  const CustomShimmer.multiple({
    super.key,
    required this.children,
    this.spacing = 15,
  }) : style = CustomShimmerStyle.multiple,
       height = 0,
       width = double.infinity,
       count = 0,
       borderRadius = 0,
       baseColor = null,
       highlightColor = null;

  final CustomShimmerStyle style;
  final double height;
  final double width;
  final int count;
  final double spacing;
  final double borderRadius;
  final List<Widget>? children;
  final Color? baseColor;
  final Color? highlightColor;

  Widget _buildItem(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final resolvedBaseColor = baseColor ?? scheme.shimmerBackground;
    final resolvedHighlightColor = highlightColor ?? scheme.shimmerHighlight;

    return Shimmer.fromColors(
      baseColor: resolvedBaseColor,
      highlightColor: resolvedHighlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: resolvedBaseColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case CustomShimmerStyle.list:
        return Column(
          spacing: spacing,
          children: List.generate(
            count,
            (_) => _buildItem(context),
          ),
        );

      case CustomShimmerStyle.multiple:
        return Column(
          spacing: spacing,
          children: children!,
        );

      case CustomShimmerStyle.card:
        return _buildItem(context);
    }
  }
}
