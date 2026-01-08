import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_app_bar_styles.dart';

enum CustomSliverAppBarThemeEnum {
  custom,
  primary,
  transparent,
  primaryContainer,
  surface,
  tertiaryFixed,
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.theme,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.custom;

  const CustomSliverAppBar.transparent({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.transparent,
       theme = null;

  const CustomSliverAppBar.primary({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.primary,
       theme = null;

  const CustomSliverAppBar.primaryContainer({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.primaryContainer,
       theme = null;

  const CustomSliverAppBar.surface({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.surface,
       theme = null;

  const CustomSliverAppBar.tertiaryFixed({
    super.key,
    this.actions,
    this.leading,
    this.title,
    this.expandedHeight,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.flexibleSpace,
  }) : customSliverAppBarThemeEnum = CustomSliverAppBarThemeEnum.tertiaryFixed,
       theme = null;

  final CustomSliverAppBarThemeEnum customSliverAppBarThemeEnum;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;
  final AppBarTheme? theme;
  final double? expandedHeight;
  final bool pinned;
  final bool floating;
  final bool snap;
  final Widget? flexibleSpace;

  AppBarTheme? _getAppBarTheme(BuildContext context) {
    return switch (customSliverAppBarThemeEnum) {
      CustomSliverAppBarThemeEnum.custom => theme,
      CustomSliverAppBarThemeEnum.primary => Theme.of(context).primaryAppBarTheme,
      CustomSliverAppBarThemeEnum.transparent => Theme.of(context).transparentAppBarTheme,
      CustomSliverAppBarThemeEnum.primaryContainer => Theme.of(context).primaryContainerAppBarTheme,
      CustomSliverAppBarThemeEnum.surface => Theme.of(context).surfaceAppBarTheme,
      CustomSliverAppBarThemeEnum.tertiaryFixed => Theme.of(context).tertiaryFixedAppBarTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    final AppBarTheme? theme = _getAppBarTheme(context);

    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight,
      backgroundColor: theme?.backgroundColor,
      foregroundColor: theme?.foregroundColor,
      surfaceTintColor: theme?.surfaceTintColor,
      shadowColor: theme?.shadowColor,
      elevation: theme?.elevation,
      iconTheme: theme?.iconTheme,
      actionsIconTheme: theme?.actionsIconTheme,
      centerTitle: theme?.centerTitle,
      titleTextStyle: theme?.titleTextStyle,
      leading: leading,
      title: title,
      actions: actions,
      automaticallyImplyLeading: false,
      flexibleSpace: flexibleSpace,
      shape: theme?.shape,
    );
  }
}
