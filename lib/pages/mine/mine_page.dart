import 'package:flutter/material.dart';
import '../../widgets/chart/line_chart/index.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  GlobalKey _scaffold = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    var painter = LineChartPainter(canvas, size);
    List<double> data = [-1, 2, 4, 3, 6, 6, -10];
    var lineData = LineChartData(data);
    painter.drawLine(lineData);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
