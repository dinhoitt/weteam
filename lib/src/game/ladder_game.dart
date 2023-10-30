import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:weteam/src/controller/counter_controller.dart';
import 'package:weteam/src/data/image_date.dart';
import 'package:weteam/src/game/ladder_painter.dart';

class LadderGame extends StatefulWidget {
  @override
  _LadderGameState createState() => _LadderGameState();
}

class _LadderGameState extends State<LadderGame> {
  final controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    double itemWidth =
        MediaQuery.of(context).size.width / controller.count.value;
    double paddingValue = (itemWidth - 60.0) / 2; // 원의 반지름을 30.0으로 가정

    return Column(
      children: [
        SizedBox(height: 20.0),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: itemWidth * controller.count.value,
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 원 위젯
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List.generate(controller.count.value, (index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: paddingValue),
                            child: Container(
                              width: 60.0, // 2 times the radius of CircleAvatar
                              height:
                                  60.0, // 2 times the radius of CircleAvatar
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  ImagePath.exlogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // LadderPainter 위젯
                    Flexible(
                      child: CustomPaint(
                        painter: LadderPainter(
                            itemCount: controller.count.value,
                            itemWidth: itemWidth),
                        child: Container(),
                      ),
                    ),
                    // 박스 위젯
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List.generate(controller.count.value, (index) {
                          return Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: paddingValue),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.blue),
                              width: itemWidth - 2 * paddingValue, // 박스의 너비 조정
                              height: 35.0,
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
