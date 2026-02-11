import 'package:get/get.dart';
import 'viewmodel/help_controller.dart';

class HelpBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpController());
  }
}
