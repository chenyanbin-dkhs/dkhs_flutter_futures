import 'package:flutter/material.dart';
import '../../../widgets/my_tab_bar.dart';

const tabs = ['实盘捕猎', '实盘模拟', '历史模拟'];

class InstrumentTypesTab extends StatelessWidget {
  const InstrumentTypesTab({Key key, @required this.controller}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return MyTabBar(
      controller: this.controller,
      tabs: tabs,
    );
  }
}
