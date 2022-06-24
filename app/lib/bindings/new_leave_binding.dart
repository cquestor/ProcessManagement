import 'package:app/controllers/new_leave_controller.dart';
import 'package:get/get.dart';

class NewLeaveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewLeaveController(), fenix: true);
  }
}
