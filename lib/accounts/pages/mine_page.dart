import 'package:flutter/material.dart';
import '../../widgets/chart/line_chart/index.dart';
import 'package:intl/intl.dart';
import '../../test/dot_line_draw.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  GlobalKey _scaffold = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: DotLineDraw(),
            ),
          ],
        )));
  }
}
