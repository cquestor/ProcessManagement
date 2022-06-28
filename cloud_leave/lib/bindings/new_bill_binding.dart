import 'package:cloud_leave/controllers/new_bill_controller.dart';
import 'package:get/get.dart';

class NewBillBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewBillController(), fenix: true);
  }
}
