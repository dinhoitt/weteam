import 'package:get/get.dart';
import 'package:weteam/src/controller/account_controlelr.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
