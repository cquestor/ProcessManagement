import 'package:cloud_leave/controllers/signin_controller.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController(), fenix: true);
  }
}
