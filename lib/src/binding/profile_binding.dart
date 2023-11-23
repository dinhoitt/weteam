import 'package:get/get.dart';
import 'package:weteam/src/controller/profile_image_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileImageController());
  }
}
