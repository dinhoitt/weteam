import 'dart:math';
import 'package:flutter/material.dart';

class LadderPainter extends CustomPainter {
  final int itemCount;
  final double itemWidth;
  final Random rand = Random();
  final List<double> horizontalLines = [];

  LadderPainter({required this.itemWidth, required this.itemCount});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    double startHeight = size.height * 0.05; // 사다리 시작
    double endHeight = size.height * 0.95; // 사다리 끝
    double horizontalStartLimit = startHeight + (endHeight - startHeight) * 0.1;
    double horizontalEndLimit = endHeight - (endHeight - startHeight) * 0.1;
    for (int i = 0; i < itemCount; i++) {
      double startX = (i + 0.5) * itemWidth;

      double randomHeight;
      if (horizontalLines.length > i) {
        randomHeight = horizontalLines[i]; // 저장된 값을 사용하여 사다리를 그림
      } else {
        randomHeight = horizontalStartLimit +
            rand.nextDouble() * (horizontalEndLimit - horizontalStartLimit);
        if (i < itemCount - 1) {
          horizontalLines.add(randomHeight); // 새로 결정된 수평선의 위치를 리스트에 추가
        }
      }

      // 수직선 그리기
      canvas.drawLine(
          Offset(startX, startHeight), Offset(startX, endHeight), paint);

      // 수평선(다리) 그리기
      if (i < itemCount - 1) {
        double nextX = (i + 1.5) * itemWidth; // 다음 아이템의 x 좌표
        canvas.drawLine(
            Offset(startX, randomHeight), Offset(nextX, randomHeight), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is LadderPainter) {
      return oldDelegate.itemCount != itemCount ||
          oldDelegate.itemWidth != itemWidth;
    }
    return true;
  }
}
