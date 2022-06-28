import 'package:cloud_leave/controllers/bill_controller.dart';
import 'package:get/get.dart';

class BillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillController(), fenix: true);
  }
}
