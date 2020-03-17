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
      points.add(Offset(xScale(i, size.width), yScale(list[i], size.height)));
    }
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }
  
}
