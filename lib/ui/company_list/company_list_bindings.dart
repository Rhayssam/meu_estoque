import 'package:get/get.dart';
import 'viemodel/company_list_controller.dart';

class CompanyListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CompanyListController());
  }
}
