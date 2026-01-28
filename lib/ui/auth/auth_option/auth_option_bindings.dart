import 'package:get/get.dart';
import './auth_option_controller.dart';

class AuthOptionBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(AuthOptionController());
    }
}