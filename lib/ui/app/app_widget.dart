import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/config/constants/app_constants.dart';
import 'package:meu_estoque/routing/app_router.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/app/app_binding.dart';
import 'package:meu_estoque/ui/core/theme/app_theme.dart';
import 'package:meu_estoque/ui/core/theme/theme_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  ThemeController get _themeController => Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _themeController.syncTheme(MediaQuery.platformBrightnessOf(context)),
    );
    return GetMaterialApp(
      title: AppConstants.appTitle,
      initialBinding: AppBindings(),
      locale: Locale('pt'),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      // initialRoute: Routes.dev,
      initialRoute: Routes.login,
      getPages: AppRouter.pages,
      unknownRoute: AppRouter.unknownRoutePage,
    );
  }
}
