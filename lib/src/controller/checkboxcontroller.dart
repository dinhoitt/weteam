import 'package:get/get.dart';

class CheckboxController extends GetxController {
  var isChecked1 = false.obs;
  var isChecked2 = false.obs;

  void toggleCheckBox1() {
    isChecked1.value = !isChecked1.value;
  }

  void toggleCheckBox2() {
    isChecked2.value = !isChecked2.value;
  }
}
