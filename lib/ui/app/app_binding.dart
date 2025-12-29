import 'package:get/get.dart';
import 'package:meu_estoque/data/services/local_storage/session/user_session_storage.dart';
import 'package:meu_estoque/ui/core/theme/theme_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    final storage = Get.find<UserSessionStorage>();
    Get.put(ThemeController(storage), permanent: true);
  }
}
