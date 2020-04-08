import 'package:flutter/material.dart';
import '../widgets/chart/line_chart/index.dart';

class DotLineDraw extends StatelessWidget {
  const DotLineDraw({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 400),
      painter: MyPainter(),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter();

  @override
  void paint(Canvas canvas, Size size) {
    DashLine.drawHorizontalLine(canvas, size, 0);
    DashLine.drawHorizontalLine(canvas, size, 100);
    DashLine.drawHorizontalLine(canvas, size, 200);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
