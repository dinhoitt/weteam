import 'package:get/get.dart';
import 'package:weteam/src/model/user.dart';

class LoginController extends GetxController {
  final user = User(id: '', password: '', nickname: '').obs;
  final isLoading = false.obs;
}
