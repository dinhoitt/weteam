import 'dart:convert';
import 'package:weteam/src/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://3.36.224.72:9090/api";

//login
  Future<Map<String, dynamic>> login(String uid, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/members/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"uid": uid, "password": password}),
    );
    if (response.statusCode == 200) {
      print('Login Success Response: ${response.body}'); // HTTP 상태코드와 응답 본문
      return jsonDecode(response.body);
    } else {
      print('Login Failed Response: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to login');
    }
  }

  Future<void> signUp(User uid) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/members/join"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(uid.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sign up');
    }
  }

  // 아이디 중복 확인
  Future<bool> checkUIdAvailability(String uid) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/members/verify/uid/$uid"),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode); // 200 뜨는지 확인
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('사용할 수 없는 아이디 입니다.');
    }
  }

  // 닉네임 중복 확인
  Future<bool> checkNicknameAvailability(String nickname) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/members/verify/nickname/$nickname"),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode); // 200 뜨는지 확인
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('Failed to check nickname availability');
    }
  }
}
