import 'package:flutter/material.dart';

class HorzontalLine {
  static double _dashWidth = 5;
  static double _dashSpace = 4;

  Canvas canvas;
  double width;
  Color color;
  HorzontalLine(this.canvas, this.width, {this.color = Colors.black12});

  static double get _eachWidth {
    return _dashWidth + _dashSpace;
  }

  Paint get paint {
    return Paint()
      ..strokeWidth = 1
      ..isAntiAlias = true
      ..color = color;
  }

  /// 画图表背景水平线
  void draw(double startY) {
    double startX = 0;

    while (startX < width) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + _dashWidth, startY),
        paint,
      );
      startX += _eachWidth;
    }
  }
}
