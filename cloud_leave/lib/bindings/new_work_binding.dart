import 'package:cloud_leave/controllers/new_work_controller.dart';
import 'package:get/get.dart';

class NewWorkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewWorkController(), fenix: true);
  }
}
