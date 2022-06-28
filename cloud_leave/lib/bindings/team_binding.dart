import 'package:cloud_leave/controllers/team_controller.dart';
import 'package:get/get.dart';

class TeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamController(), fenix: true);
  }
}
