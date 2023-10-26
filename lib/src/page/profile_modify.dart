import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weteam/src/controller/profile_controller.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/widget/tagkategorie.dart';

class Profile_Modify extends StatefulWidget {
  @override
  _Profile_ModifyState createState() => _Profile_ModifyState();
}

class _Profile_ModifyState extends State<Profile_Modify> {
  final ProfileController controller = Get.find();

  Rx<File?> _selectImageFile = Rx<File?>(null);
  RxString selectedTag = ''.obs;
  RxBool showMBTITags = false.obs;
  RxBool showPOSTags = false.obs;

  _selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectImageFile.value = File(image.path);
      });
    }
  }

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
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
          child: Obx(() {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.05),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: new Text('프로필 사진 설정'),
                                onTap: () {},
                              ),
                              ListTile(
                                title: new Text('갤러리에서 사진 선택'),
                                onTap: () {
                                  _selectImage();
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: new Text('직접 사진 찍기'),
                                onTap: () {
                                  //카메라 키기
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: new Text('기존 이미지 삭제'),
                                onTap: () {
                                  // 삭제하는 기능
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Obx(
                      () => ClipOval(
                        child: Container(
                          color: Colors.blue,
                          width: 120.0,
                          height: 120,
                          child: _selectImageFile.value == null
                              ? Container(
                                  child: Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Image.file(
                                  _selectImageFile.value!,
                                  fit: BoxFit.cover,
                                ),
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
                          scale: 0.6, child: Image.asset(ImagePath.mapsearch)),
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
                      horizontal: 1.0, vertical: 5.0),
                  child: Container(
                    width: (Get.width),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Obx(
                        () => Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15.0, // 각각의 태그 사이의 가로 간격
                          runSpacing: 8.0, // 줄 사이의 간격
                          children: [
                            TagKategorie(
                              text: '희망업무',
                              isSelected: selectedTag == '희망업무',
                              onSelected: () {
                                setState(() {
                                  selectedTag.value = '희망업무';
                                  showPOSTags.value = true;
                                  showMBTITags.value = false;
                                });
                              },
                            ),
                            TagKategorie(
                              text: 'MBTI',
                              isSelected: selectedTag == 'MBTI',
                              onSelected: () {
                                setState(() {
                                  selectedTag.value = 'MBTI';
                                  showPOSTags.value = false;
                                  showMBTITags.value = true;
                                });
                              },
                            ),
                            TagKategorie(
                              text: '특기',
                              isSelected: selectedTag == '특기',
                              onSelected: () {
                                setState(() {
                                  selectedTag.value = '특기';
                                  showPOSTags.value = false;
                                  showMBTITags.value = false;
                                });
                              },
                            ),
                            TagKategorie(
                              text: '설정',
                              isSelected: selectedTag == '설정',
                              onSelected: () {
                                setState(() {
                                  selectedTag.value = '설정';
                                  showPOSTags.value = false;
                                  showMBTITags.value = false;
                                });
                              },
                            ),
                            TagKategorie(
                              text: '기타',
                              isSelected: selectedTag == '기타',
                              onSelected: () {
                                setState(() {
                                  selectedTag.value = '기타';
                                  showPOSTags.value = false;
                                  showMBTITags.value = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (showMBTITags.value) _buildMBTITags(), // 여기서 MBTI 태그를 표시합니다.
                if (showPOSTags.value) _buildPosTags(),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMBTITags() {
    List<String> mbtiTags = [
      'ENFP',
      'ENTJ',
      'ENTP',
      'ENFJ',
      'ESTP',
      'ESTJ',
      'ESFJ',
      'ESFP',
      'INFP',
      'INFJ',
      'INTP',
      'INTJ',
      'ISFP',
      'ISFJ',
      'ISTP',
      'ISTJ',
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth =
        (screenWidth - (5 * 8.0)) / 4; // (화면너비 - (간격 * 5)) / 4개 항목
    return Container(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: mbtiTags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.blue, width: 0.5),
                ),
                child: Text(
                  '# $tag',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPosTags() {
    List<String> mbtiTags = [
      '팀장',
      'PPT 제작',
      '타이핑',
      '자료조사',
      '발표',
      '영상편집',
      '일러스트',
      '디자인',
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth =
        (screenWidth - (5 * 8.0)) / 4; // (화면너비 - (간격 * 5)) / 4개 항목
    return Container(
      width: 270.0,
      child: Wrap(
        spacing: 6.0, // 태그 사이의 가로 간격
        runSpacing: 8, // 태그 사이의 세로 간격
        children: mbtiTags.map((tag) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: Colors.blue, width: 0.5),
                ),
                child: Text(
                  '# $tag',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
