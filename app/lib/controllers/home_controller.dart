import 'package:get/get.dart';

class HomeController extends GetxController {
  void toLeave() {
    Get.toNamed("/newleave");
  }

  void toLeaveList() {
    Get.toNamed("/leavelist");
  }

  void toBill() {
    Get.toNamed("/bill");
  }

  void toFieldwork() {
    Get.toNamed("/fieldwork");
  }
}
