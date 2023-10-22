import 'package:get/get.dart';
import 'package:weteam/src/controller/image_controller.dart';

class ImageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImagePickerController());
  }
}
