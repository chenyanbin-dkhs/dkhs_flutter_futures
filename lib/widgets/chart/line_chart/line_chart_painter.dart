import 'package:flutter/material.dart';
import './line_chart_data.dart';

class LineChartPainter {
  Paint paint;
  Canvas canvas;
  Size size;
  LineChartPainter(Canvas canvas, Size size) {
    this.canvas = canvas;
    this.size = size;
    this.paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;
  }

  void drawLine(LineChartData lineChartData) {
    var list = lineChartData.list;
    var xScale = lineChartData.xScale;
    var yScale = lineChartData.yScale;

    List<Offset> points = [];
    for (int i = 0; i < list.length; i++) {
      points.add(Offset(xScale(i, size.width), yScale(list[i], size.height)));
    }

    for (int i = 0; i < points.length - 1; i++) {
      Offset from = points[i];
      Offset to = points[i + 1];

      if (from.dx != null &&
          from.dy != null &&
          to.dx != null &&
          to.dy != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }
}
