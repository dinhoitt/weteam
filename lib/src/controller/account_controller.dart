import 'package:get/get.dart';
import 'package:weteam/src/model/user.dart';
import 'package:weteam/src/util/api_service.dart';

class AccountController extends GetxController {
  final isLoading = false.obs;
  final isUserIdAvailable = false.obs;
  final isNicknameAvailable = false.obs;
  final ApiService _apiService = ApiService();

  // 회원가입 메서드
  Future<bool> signUp(
    String userId,
    String password,
    String nickname,
  ) async {
    isLoading.value = true;
    try {
      var newUser =
          User(username: userId, password: password, nickname: nickname);
      await _apiService.signUp(newUser);
      Get.snackbar('Success', '회원가입 성공');
      return true;
    } catch (e) {
      Get.snackbar('Error', '회원가입 실패: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // 로그인 메서드 추가
  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      await _apiService.login(username, password);
      Get.snackbar('Success', '로그인 성공');
    } catch (e) {
      Get.snackbar('Error', '로그인 실패: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkUserIdAvailability(String userId) async {
    try {
      bool available = await _apiService.checkUsernameAvailability(userId);
      isUserIdAvailable.value = available;

      if (available) {
        // 아이디가 사용 가능한 경우
        Get.snackbar('성공', '아이디를 사용할 수 있습니다!');
        Get.snackbar('성공', '아이디를 사용할 수 있습니다!');
      } else {
        // 아이디가 이미 사용 중인 경우
        Get.snackbar('오류', '이미 사용 중인 아이디입니다',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // 오류 처리
      Get.snackbar('Error', '사용자 이름 중복 확인 중 오류 발생: $e');
    }
  }

  Future<void> checkNicknameAvailability(String nickname) async {
    try {
      bool available = await _apiService.checkNicknameAvailability(nickname);
      isNicknameAvailable.value = available;

      if (available) {
        //닉네임이 사용 가능한 경우
        Get.snackbar('성공', '닉네임을 사용할 수 있습니다');
      } else {
        //닉네임이 이미 사용 중인 경우
        Get.snackbar('오류', '이미 사용 중인 닉네임입니다.');
      }
    } catch (e) {
      // 오류 처리
      Get.snackbar('Error', '닉네임 중복 확인 중 오류 발생: $e');
    }
  }
}
