import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weteam/src/model/profile_model.dart';
import 'package:weteam/src/model/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://15.164.221.170:9090/api";
  final _storage = const FlutterSecureStorage(); // JWT 저장할 인스턴스 생성

//login
  Future<String> login(String uid, String password) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"uid": uid, "password": password}),
    );
    if (response.statusCode == 200) {
      // Directly store the JWT, don't try to decode it as JSON
      final jwt = response.body;
      await _storage.write(key: 'jwt', value: jwt);
      print('Login Success. JWT: $jwt');
      return jwt; // Return the JWT string for now
    } else {
      // Handle the error appropriately
      print(
          'Login Failed. Status Code: ${response.statusCode}. Response Body: ${response.body}');
      throw Exception(
          'Failed to login with status code: ${response.statusCode}');
    }
  }

  //회원가입
  Future<void> signUp(User uid) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/auth/join"),
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
      Uri.parse("$_baseUrl/auth/verify/uid/$uid"),
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
      Uri.parse("$_baseUrl/auth/verify/nickname/$nickname"),
      headers: {"Content-Type": "application/json"},
    );
    print(response.statusCode); // 200 뜨는지 확인
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['result'];
    } else {
      throw Exception('Failed to check nickname availability');
    }
  }

  // profile_edit 메소드
  Future<void> saveProfile(ProfileModel profile) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(profile.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to save profile information');
    }
  }
}
