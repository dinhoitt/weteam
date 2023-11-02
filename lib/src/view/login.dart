import 'package:flutter/material.dart';
import 'package:weteam/src/data/image_date.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(ImagePath.loginlogo),
            Image.asset(ImagePath.loginbutton),
            Image.asset(ImagePath.logingoogle),
            Image.asset(ImagePath.loginkakao)
          ],
        ),
      ),
    );
  }
}
