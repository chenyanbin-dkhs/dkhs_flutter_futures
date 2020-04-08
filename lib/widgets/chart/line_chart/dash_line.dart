import 'package:flutter/material.dart';

class DashLine {
  static double _dashWidth = 5;
  static double _dashSpace = 4;

  static double get _eachWidth {
    return _dashWidth + _dashSpace;
  }

  static Paint get paint {
    return Paint()
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..color = Color(0x77cdb175);
  }

  /// 画图表背景水平线
  static void drawHorizontalLine(Canvas canvas, Size size, double startY) {
    double chartWidth = size.width;

    double startX = 0;

    while (startX < chartWidth) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + _dashWidth, startY),
        paint,
      );
      startX += _eachWidth;
    }
  }
}
