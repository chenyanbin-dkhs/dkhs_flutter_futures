import 'package:flutter/material.dart';
import './line_chart_data.dart';
import './horizontal_line.dart';
import './y_axis.dart';

class LineChartPainter {
  BuildContext context;
  Paint paint;
  Canvas canvas;
  Size size;
  LineChartData lineChartData;
  double paddingLeft;

  LineChartPainter(BuildContext context, Canvas canvas, Size size,
      {Color color, double paddingLeft = 0}) {
    this.context = context;
    this.canvas = canvas;
    this.size = size;
    this.paddingLeft = paddingLeft;
    this.paint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = 0.8;
  }

  void setPaintColor(Color color) {
    this.paint.color = color;
  }

  void setChartData(LineChartData lineChartData) {
    this.lineChartData = lineChartData;
  }

  void drawLine() {
    if (lineChartData == null) {
      throw Exception('drawLine 未设置数据源');
    }
    var list = lineChartData.list;
    var xScale = lineChartData.xScale;
    var yScale = lineChartData.yScale;

    List<Offset> points = [];
    for (int i = 0; i < list.length; i++) {
      points.add(Offset(xScale(i, size.width - paddingLeft) + paddingLeft,
          yScale(list[i], size.height)));
    }

    for (int i = 0; i < points.length - 1; i++) {
      Offset from = points[i];
      Offset to = points[i + 1];

      if (from.dx != null &&
          from.dy != null &&
          to.dx != null &&
          to.dy != null) {
        canvas.drawLine(from, to, paint);
      }
    }
  }

  void drawBackground() {
    canvas.drawRect(
        Rect.fromPoints(
            Offset(paddingLeft, 0.0), Offset(size.width, size.height)),
        Paint()
          ..color = Colors.black12
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke);
    _drawHorizontalLines();
  }

  /// 画水平曲线
  void _drawHorizontalLines() {
    if (lineChartData == null) {
      throw Exception('drawLine 未设置数据源');
    }

    int yTickSize = lineChartData.yTickSize;
    var tickHeight = _tickHeight(yTickSize);
    for (int i = 1; i < yTickSize - 1; i++) {
      double endY = i * tickHeight;
      HorzontalLine(canvas, size.width).draw(paddingLeft, endY);
    }
  }

  //画Y轴上面的刻度值
  void drawYAxisPercentage() {
    if (lineChartData == null) {
      throw Exception('drawLine 未设置数据源');
    }

    YAxisPercentage(canvas, size.height).draw(lineChartData.tickValues);
  }

  void drawYAxisPercentageAndValue(double baseValue) {
    if (lineChartData == null) {
      throw Exception('drawLine 未设置数据源');
    }

    YAxisPercentageAndValue(canvas, size.height, baseValue)
        .draw(lineChartData.tickValues);
  }

  /// Y轴上面每个刻度之间的间隔
  double _tickHeight(int yTickSize) {
    return this.size.height / (yTickSize - 1);
  }
}
