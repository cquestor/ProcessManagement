import 'package:cloud_leave/controllers/work_controller.dart';
import 'package:get/get.dart';

class WorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkController(), fenix: true);
  }
}
