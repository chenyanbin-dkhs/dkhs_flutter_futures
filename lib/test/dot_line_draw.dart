import 'package:dkhs_flutter_futures/widgets/chart/line_chart/y_axis.dart';
import 'package:flutter/material.dart';
import '../widgets/chart/line_chart/index.dart';
import '../widgets/chart/line_chart/y_axis.dart';

class DotLineDraw extends StatelessWidget {
  const DotLineDraw({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 400),
      painter: MyPainter(context),
    );
  }
}

class MyPainter extends CustomPainter {
  BuildContext context;
  MyPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    var painter =
        new LineChartPainter(context, canvas, size, color: Colors.red);
    var lineData = new LineChartData([1, 2, 3, 4, -2, 9, -3, 2, 5]);
    print(lineData.tickValues);
    painter.drawHorizontalLines(lineData.yTickSize);
    painter.drawLine(lineData);
    new YAxis(canvas, size.height).drawPercentage(lineData.tickValues);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
