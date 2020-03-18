import 'package:flutter/material.dart';
import './line_chart_data.dart';

import './line_chart_painter.dart';

class LineChartSimple extends StatelessWidget {
  const LineChartSimple(
    this.data, {
    Key key,
    this.width = 100,
    this.height = 50,
  }) : super(key: key);
  final List<double> data;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(this.width, this.height),
      painter: MyPainter(this.data),
    );
  }
}

class MyPainter extends CustomPainter {
  List<double> data;

  MyPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    var painter = new LineChartPainter(canvas, size);
    var lineData = new LineChartData(data);
    painter.drawLine(lineData);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}
