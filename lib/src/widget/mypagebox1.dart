import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/mypage_controller.dart';
import 'package:weteam/src/data/image_date.dart';

class MyPageBox1 extends StatelessWidget {
  final MyPageController controller = Get.put(MyPageController());

  double progressValue = 0.7;

  MyPageBox1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: double.infinity,
        height: 250.0,
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // 항목들을 가운데 정렬
                  children: <Widget>[
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ClipOval(
                            child: controller.mypageImagePath.value.isNotEmpty
                                ? Image.file(
                                    File(controller.mypageImagePath.value),
                                    width: 100.0,
                                    height: 100.0,
                                  )
                                : Container(
                                    color: Colors.grey,
                                    width: 100.0,
                                    height: 100.0,
                                    child: Center(
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      );
                    }),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'xxx님',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text('xx대 xxxxx 학부'),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 2.0,
                                runSpacing: 5.0,
                                children: [
                                  _roleTag('# PPT 제작'),
                                  _roleTag('# 일본어'),
                                  _roleTag('# PPT 제작'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
              ),
              Row(
                children: [
                  Text(
                    '내 팀메이트력',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2.0,
                      vertical: 8.0,
                    ),
                    child: Image.asset(
                      ImagePath.miniinfo,
                      width: 16,
                      height: 16,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 10.0,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(5.0),
                        value: progressValue,
                        backgroundColor: Colors.grey,
                        color: Color(0xFFE2583E),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-1 + 2 * progressValue, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(ImagePath.arrow),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              '${(progressValue * 100).toInt()}%',
                              style: TextStyle(
                                  color: Color(0xFFE2583E),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 1.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xFF2296F3),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 10.0),
      ),
    );
  }
}
