import 'package:get/get.dart';
import './inventory_controller.dart';

class InventoryBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(InventoryController());
    }
}