import 'package:cloud_leave/controllers/work_list_controller.dart';
import 'package:get/get.dart';

class WorkListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkListController(), fenix: true);
  }
}
