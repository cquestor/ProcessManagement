import 'package:cloud_leave/controllers/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
