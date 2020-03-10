import 'package:flutter/material.dart';

// 参考 https://medium.com/flutterpub/flutter-boring-tab-to-cool-tab-bfcb1a93f8d0
const double tabWidth = 80;
const double tabHeight = 30;

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key key, @required this.controller, @required this.tabs})
      : super(key: key);
  final TabController controller;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).primaryColorDark;
    return Container(
      width: tabs.length * tabWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: bgColor, width: 0.5)),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 0,
        unselectedLabelColor: bgColor,
        labelColor: Colors.white,
        indicator: BoxDecoration(color: bgColor),
        labelPadding: EdgeInsets.all(0), // 找了半天，才知道是这个属性
        tabs: tabs
            .asMap()
            .map((index, value) =>
                MapEntry(index, _buildTab(bgColor, value, index == 0)))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildTab(Color bgColor, String text, [bool isFirst = false]) {
    var borderLeftDecoration = isFirst
        ? BoxDecoration(
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(15.0),
            //     bottomRight: Radius.circular(15.0)),
            )
        : BoxDecoration(
            border: Border(left: BorderSide(color: bgColor, width: 0.5)));

    return Container(
      width: tabWidth,
      height: tabHeight,
      decoration: borderLeftDecoration,
      child: Center(child: Text(text)),
    );
  }
}
