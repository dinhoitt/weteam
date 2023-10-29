// counter_controller.dart
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 6.obs;

  void increment() {
    if (count.value < 10) count.value++;
  }

  void decrement() {
    if (count.value > 1) count.value--;
  }
}
