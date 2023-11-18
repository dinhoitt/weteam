import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/page/laddersetting.dart';

class BuildBox3 extends StatelessWidget {
  const BuildBox3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // 상하좌우에 그림자 적용
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(() => LadderSettingPage());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 4.0),
                      child: Column(
                        children: [
                          Text('업무 분배가 막막하다면?'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        '사다리 타기',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        ImagePath.ladder,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.fill,
                      ), // 사다리 이미지 여백 더 적게 변경
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    // 상하좌우에 그림자 적용
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 4.0),
                    child: Column(
                      children: [
                        Text('팀플이 처음인 새내기!'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      '팀플 꿀팁 모음',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        ImagePath.tipicon,
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
