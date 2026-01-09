import 'package:get/get.dart';
import 'viewmodel/sales_controller.dart';

class SalesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SalesController());
  }
}
