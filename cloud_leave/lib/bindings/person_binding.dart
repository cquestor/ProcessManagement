import 'package:cloud_leave/controllers/person_controller.dart';
import 'package:get/get.dart';

class PersonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonController(), fenix: true);
  }
}
