import 'package:get/get.dart';
import 'viemodel/product_list_controller.dart';

class ProductListBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductListController());
  }
}
