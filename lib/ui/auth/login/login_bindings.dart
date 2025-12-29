import 'package:get/get.dart';
import 'package:meu_estoque/ui/auth/login/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
