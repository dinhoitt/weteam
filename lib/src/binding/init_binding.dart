import 'package:get/get.dart';
import 'package:weteam/src/controller/bottom_nav_controller.dart';
import 'package:weteam/src/controller/schedule_controller.dart';
import 'package:weteam/src/controller/tags_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.lazyPut(() => CalendarController()); // 일정 추가 컨트롤러
    Get.lazyPut(() => TagsController()); // 태그 컨트롤러
  }
}
