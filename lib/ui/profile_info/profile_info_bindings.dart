import 'package:get/get.dart';
import 'viewmodel/profile_info_controller.dart';

class ProfileInfoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileInfoController());
  }
}
