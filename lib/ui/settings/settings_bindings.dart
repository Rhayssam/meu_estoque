import 'package:get/get.dart';
import 'viewmodel/settings_controller.dart';

class SettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
