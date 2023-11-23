import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/profile_controller.dart';
import 'package:weteam/src/widget/profile_edit_widget/profile_modify_body.dart';

class Profile_Edit extends StatefulWidget {
  const Profile_Edit({super.key});

  @override
  _Profile_EditState createState() => _Profile_EditState();
}

class _Profile_EditState extends State<Profile_Edit> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          title: const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              '내 프로필 수정하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: profileeditbody(context),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
    );
  }
}
