import 'package:cloud_leave/controllers/leave_list_controller.dart';
import 'package:get/get.dart';

class LeaveListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveListController(), fenix: true);
  }
}
