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
    final painter =
        new LineChartPainter(context, canvas, size, color: Colors.red);

    final lineData = new LineChartData([1, 2, -1, 4, 2, 9, -3, 2, 5],
        domainType: DataDomainType.middleZero);

    painter
      ..setChartData(lineData)
      ..drawHorizontalLines()
      ..drawLine()
      ..drawYAxisPercentage();
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
