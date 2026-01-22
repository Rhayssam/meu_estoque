import 'package:get/get.dart';
import 'viewmodel/product_add_controller.dart';

class ProductAddBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductAddController());
  }
}
