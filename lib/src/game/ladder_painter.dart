import 'dart:math';
import 'package:flutter/material.dart';

class LadderPainter extends CustomPainter {
  final int itemCount;
  final double itemWidth;
  final Random rand = Random();
  final List<List<double>> horizontalLines = [];

  LadderPainter({required this.itemWidth, required this.itemCount}) {
    while (horizontalLines.length < itemCount - 1) {
      horizontalLines.add(_generateRandomHorizontalLines(horizontalLines));
    }
  }

  List<double> _generateRandomHorizontalLines(
      List<List<double>> existingLines) {
    List<double> lines = [];
    int numOfHorizontalLines = rand.nextInt(3) + 1; // 최대 3개의 수평선

    for (int i = 0; i < numOfHorizontalLines; i++) {
      double randomHeight;
      do {
        randomHeight = rand.nextDouble();
      } while (lines.any((height) => (height - randomHeight).abs() < 0.1) ||
          existingLines.any((list) => list.contains(randomHeight)));
      lines.add(randomHeight);
    }

    return lines;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    double startHeight = size.height * 0.05;
    double endHeight = size.height * 0.95;
    double horizontalStartLimit = startHeight + (endHeight - startHeight) * 0.1;
    double horizontalEndLimit = endHeight - (endHeight - startHeight) * 0.1;

    for (int i = 0; i < itemCount; i++) {
      double startX = (i + 0.5) * itemWidth;

      // 수직선 그리기
      canvas.drawLine(
          Offset(startX, startHeight), Offset(startX, endHeight), paint);

      if (i < itemCount - 1) {
        double nextX = (i + 1.5) * itemWidth; // 다음 아이템의 x 좌표
        for (var ratio in horizontalLines[i]) {
          double actualHeight = horizontalStartLimit +
              ratio * (horizontalEndLimit - horizontalStartLimit);
          // 수평선(다리) 그리기
          canvas.drawLine(
              Offset(startX, actualHeight), Offset(nextX, actualHeight), paint);
        }
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
