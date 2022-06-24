import 'package:app/controllers/leave_controller.dart';
import 'package:get/get.dart';

class LeaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveController(), fenix: true);
  }
}
