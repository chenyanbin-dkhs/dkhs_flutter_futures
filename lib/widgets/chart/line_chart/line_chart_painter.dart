import 'package:flutter/material.dart';
import './line_chart_data.dart';
import './dash_line.dart';
import './canvas_text.dart';

class LineChartPainter {
  BuildContext context;
  Paint paint;
  Canvas canvas;
  Size size;

  LineChartPainter(BuildContext context, Canvas canvas, Size size,
      {Color color}) {
    this.context = context;
    this.canvas = canvas;
    this.size = size;
    this.paint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = 0.8;
  }

  void setPaintColor(Color color) {
    this.paint.color = color;
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
        canvas.drawLine(from, to, paint);
      }
    }
  }

  /// 画水平曲线
  void drawHorizontalLines(int yTickSize) {
    var tickHeight = _tickHeight(yTickSize);

    for (int i = 0; i < yTickSize; i++) {
      double endY = i * tickHeight;
      DashLine.drawHorizontalLine(canvas, size, endY);
    }
  }

  // void drawHorizontalLabel(int yTickSize) {
  //   var tickHeight = _tickHeight(yTickSize);

  //   for (int i = 0; i < yTickSize; i++) {
  //     double endY = i * tickHeight;
  //     DashLine.drawHorizontalLine(canvas, size, endY);
  //     CanvasText('12.22%', 0, endY).draw(canvas);
  //   }
  // }

  /// Y轴上面每个刻度之间的间隔
  double _tickHeight(int yTickSize) {
    return this.size.height / (yTickSize - 1);
  }
}
