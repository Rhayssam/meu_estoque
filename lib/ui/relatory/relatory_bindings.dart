import 'package:get/get.dart';
import 'viewmodel/relatory_controller.dart';

class RelatoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RelatoryController());
  }
}
