import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyPageController extends GetxController {
  var mypageImagePath = ''.obs;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      mypageImagePath.value = pickedFile.path;
    }
  }
}
