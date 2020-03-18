import 'package:flutter/material.dart';
import '../../widgets/chart/line_chart/index.dart';
import 'package:intl/intl.dart';

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
        child: Text('data'),
      ),
    );
  }
}
