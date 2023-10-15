import 'package:get/get.dart';
import 'package:weteam/src/controller/bottom_nav_controller.dart';
import 'package:weteam/src/controller/home_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(HomeController());
  }
}
