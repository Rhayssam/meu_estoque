import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        Get.offAllNamed(Routes.login);
      },
    );
    super.onInit();
  }
}
