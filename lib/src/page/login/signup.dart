import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/login_controller.dart';
import 'package:weteam/src/data/image_date.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUP> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordMatched = false;
  TextEditingController _userIdController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();

  final LoginController loginController =
      Get.find<LoginController>(); // LoginController 인스턴스화

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validatePassword);
  }

  _validatePassword() {
    if (_passwordController.text == _confirmPasswordController.text) {
      setState(() {
        _isPasswordMatched = true;
      });
    } else {
      setState(() {
        _isPasswordMatched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image.asset(ImagePath.signuplogo),
                ),
                Text(
                  '회원가입',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff767676),
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '아이디',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _userIdController, // UserId 컨트롤러 연결
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '아이디 입력(5~11자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                            errorText: _userIdController.text.length < 5 ||
                                    _userIdController.text.length > 11
                                ? '아이디는 5-11자 사이여야 합니다.'
                                : null,
                          ),
                          autovalidateMode: AutovalidateMode
                              .onUserInteraction, // 사용자 상호작용시 검증 활성화
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              ImagePath.signupcheck,
                              height: 28.0,
                              width: 75.0,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '비밀번호',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '비밀번호 확인',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            hintText: '비밀번호(숫자, 영문, 특수문자 조합 최소 8자)',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Checkbox(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap, //체크박스 기본 패딩 제거
                          activeColor: Color(0xFFC86148),
                          value: _isPasswordMatched,
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      Text(
                        '닉네임',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            hintText: '닉네임 입력',
                            hintStyle: TextStyle(fontSize: 12.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide:
                                  BorderSide(width: 6.0, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0, right: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              // 닉네임 중복확인 버튼
                            },
                            child: Image.asset(
                              ImagePath.signupcheck,
                              height: 28.0,
                              width: 75.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: GestureDetector(
                          onTap: () async {
                            if (_isPasswordMatched) {
                              await loginController.signUp(
                                _userIdController.text,
                                _passwordController.text,
                                _nicknameController.text,
                              );
                            } else {
                              Get.snackbar('오류', '비밀번호가 일치하지 않습니다.');
                            }
                          },
                          //회원가입 완료 이미지 or 위젯
                          child: Image.asset(
                            ImagePath.completebutton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
