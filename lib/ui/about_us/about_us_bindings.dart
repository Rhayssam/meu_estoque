import 'package:get/get.dart';
import './about_us_controller.dart';

class AboutUsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(AboutUsController());
    }
}