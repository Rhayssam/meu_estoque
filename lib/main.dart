import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meu_estoque/config/constants/app_constants.dart';
import 'package:meu_estoque/dependencies.dart';
import 'package:meu_estoque/ui/app/app_widget.dart';

Future<void> main(List<String> args) async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Dependencies().initialize();
  FlutterNativeSplash.remove();

  runApp(
    DevicePreview(
      enabled: AppConstants.kDevicePreviewEnable,
      builder: (_) {
        return AppWidget();
      },
    ),
  );
}
