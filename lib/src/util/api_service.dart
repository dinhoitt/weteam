import 'dart:convert';
import 'package:weteam/src/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://3.36.224.72:8080/api";

  Future<void> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/users/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"username": username, "password": password}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to login');
    }
  }

  Future<void> signUp(User user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/users/join"),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to sign up');
    }
  }

  // 아이디 중복 확인
  Future<bool> checkUsernameAvailability(String username) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/users/verify/username/$username"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('사용할 수 없는 아이디 입니다.');
    }
  }

  // 닉네임 중복 확인
  Future<bool> checkNicknameAvailability(String nickname) async {
    final response = await http.get(
      Uri.parse("$_baseUrl/users/verify/nickname/{nickname}"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('Failed to check nickname availability');
    }
  }
}
