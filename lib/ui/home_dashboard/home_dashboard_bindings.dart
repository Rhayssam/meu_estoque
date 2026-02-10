import 'package:get/get.dart';
import 'viewmodel/home_dashboard_controller.dart';

class HomeDashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeDashboardController());
  }
}
