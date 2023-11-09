import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weteam/src/model/user.dart';

class AccountController extends GetxController {
  final isLoading = false.obs;
  final isUserIdAvailable = false.obs;
  final isNicknameAvailable = false.obs;

  // 회원가입 메서드
  Future<void> signUp(String userId, String password, String nickname) async {
    isLoading.value = true;
    try {
      var newUser =
          User(username: userId, password: password, nickname: nickname);

      // http post 요청
      final response = await http.post(
        Uri.parse(
            'http://3.36.224.72:8080/api/users/join'), // 실제 요청할 서버의 URL을 입력하세요.
        body: json.encode(newUser.toJson()), // User 모델을 JSON으로 인코딩
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        // JWT 처리 로직 (예: 저장)
        // var jwtToken = json.decode(response.body)['token'];
        // 저장 예시: await storage.write(key: 'jwt_token', value: jwtToken);
        Get.snackbar('Success', '회원가입 성공');
      } else {
        // 오류 처리
        Get.snackbar('Error', '회원가입 실패: ${json.decode(response.body)}');
      }
    } catch (e) {
      // 예외 처리
      Get.snackbar('Error', '예외 발생: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // 로그인 메서드 추가
  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse('http://3.36.224.72:8080/api/users/login'),
        body: json.encode({'username': username, 'password': password}),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      if (response.statusCode == 200) {
        // 로그인 성공 처리, 예: JWT 토큰 저장
        // var jwtToken = json.decode(response.body)['token'];
        // 저장 예시: await storage.write(key: 'jwt_token', value: jwtToken);
        Get.snackbar('Success', '로그인 성공');
      } else {
        // 로그인 실패 처리
        Get.snackbar('Error', '로그인 실패: ${json.decode(response.body)}');
      }
    } catch (e) {
      // 네트워크 오류 등의 예외 처리
      Get.snackbar('Error', '예외 발생: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // 중복 확인 로직 (예시)
  Future<void> checkUserIdAvailability(String userId) async {
    // 서버에 아이디 중복 체크를 위한 요청을 보내는 코드를 여기에 추가합니다.
    // 결과에 따라 isUserIdAvailable 상태를 업데이트합니다.
  }

  // 중복 확인 로직 (예시)
  Future<void> checkNicknameAvailability(String nickname) async {
    // 서버에 닉네임 중복 체크를 위한 요청을 보내는 코드를 여기에 추가합니다.
    // 결과에 따라 isNicknameAvailable 상태를 업데이트합니다.
  }
}
