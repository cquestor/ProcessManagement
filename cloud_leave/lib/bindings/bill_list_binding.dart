import 'package:cloud_leave/controllers/bill_list_controller.dart';
import 'package:get/get.dart';

class BillListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BillListController(), fenix: true);
  }
}
