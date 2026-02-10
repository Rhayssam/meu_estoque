import 'package:get/get.dart';
import 'viewmodel/store_controller.dart';

class StoreBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(StoreController());
    }
}