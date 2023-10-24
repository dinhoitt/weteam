import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/profile_controller.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/widget/tagkategorie.dart';

class Profile_Modify extends StatefulWidget {
  @override
  _Profile_ModifyState createState() => _Profile_ModifyState();
}

class _Profile_ModifyState extends State<Profile_Modify> {
  final ProfileController controller = Get.find();
  String? selectedTag;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F5F5),
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              '내 프로필 수정하기',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
          centerTitle: true,
        ),
        body: _body(),
        backgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.0,
              spreadRadius: 2.0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              await controller.pickImage();
            },
            child: Obx(() {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.05),
                    child: ClipOval(
                      child: controller.profileImagePath.value.isNotEmpty
                          ? Image.file(
                              File(controller.profileImagePath.value),
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              color: Colors.blue,
                              width: 120.0,
                              height: 120,
                              child: Center(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Transform.scale(
                            scale: 0.6,
                            child: Image.asset(ImagePath.mapsearch)),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none, // 텍스트 필드 아래 줄 제거
                              hintText: '소속',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    child: Container(
                      width: (Get.width),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10.0, // 각각의 태그 사이의 가로 간격
                          runSpacing: 8.0, // 줄 사이의 간격
                          children: [
                            TagKategorie(
                              text: '희망업무',
                              isSelected: selectedTag == '희망업무',
                              onSelected: () {
                                setState(() {
                                  selectedTag = '희망업무';
                                });
                              },
                            ),
                            TagKategorie(
                              text: 'MBTI',
                              isSelected: selectedTag == 'MBTI',
                              onSelected: () {
                                setState(() {
                                  selectedTag = 'MBTI';
                                });
                              },
                            ),
                            TagKategorie(
                              text: '특기',
                              isSelected: selectedTag == '특기',
                              onSelected: () {
                                setState(() {
                                  selectedTag = '특기';
                                });
                              },
                            ),
                            TagKategorie(
                              text: '설정',
                              isSelected: selectedTag == '설정',
                              onSelected: () {
                                setState(() {
                                  selectedTag = '설정';
                                });
                              },
                            ),
                            TagKategorie(
                              text: '기타',
                              isSelected: selectedTag == '기타',
                              onSelected: () {
                                setState(() {
                                  selectedTag = '기타';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
