import 'package:get/get.dart';
import 'viewmodel/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
