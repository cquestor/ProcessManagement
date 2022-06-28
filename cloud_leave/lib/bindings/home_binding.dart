import 'package:cloud_leave/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
