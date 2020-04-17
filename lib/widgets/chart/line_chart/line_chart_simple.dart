import 'package:flutter/material.dart';
import './line_chart_data.dart';

import './line_chart_painter.dart';

class LineChartSimple extends StatelessWidget {
  const LineChartSimple(this.data,
      {Key key, this.width = 100, this.height = 50, this.color})
      : super(key: key);
  final List<double> data;
  final double width;
  final double height;

  /// 曲线颜色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(this.width, this.height),
      painter: MyPainter(context, this.data, this.color),
    );
  }
}

class MyPainter extends CustomPainter {
  BuildContext context;

  List<double> data;
  final Color color;
  MyPainter(this.context, this.data, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    var painter =
        new LineChartPainter(context, canvas, size, color: this.color);

    var lineData = new LineChartData(data);
    painter.drawHorizontalLines(lineData.yTickSize);
    painter.drawLine(lineData);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
