import 'package:flutter/material.dart';

// 参考 https://medium.com/flutterpub/flutter-boring-tab-to-cool-tab-bfcb1a93f8d0
const double tabWidth = 80;
const double tabHeight = 30;

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key key, @required this.controller}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          border: Border.all(color: Colors.redAccent, width: 0.5)),
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 0,
        unselectedLabelColor: Colors.redAccent,

        indicator: BoxDecoration(color: Colors.redAccent),
        labelPadding: EdgeInsets.all(0), // 找了半天，才知道是这个属性
        tabs: [
          _buildTab('实盘捕猎', true),
          _buildTab('实盘模拟'),
          _buildTab('历史模拟'),
        ],
      ),
    );
  }

  Widget _buildTab(String text, [bool isFirst = false]) {
    var borderLeftDecoration = isFirst
        ? BoxDecoration(
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(15.0),
            //     bottomRight: Radius.circular(15.0)),
          )
        : BoxDecoration(
            border:
                Border(left: BorderSide(color: Colors.redAccent, width: 0.5)));

    return Container(
      width: tabWidth,
      height: tabHeight,
      decoration: borderLeftDecoration,
      child: Center(child: Text(text)),
    );
    // return Tab(
    //   child: Container(
    //     decoration: BoxDecoration(
    //         border: Border.all(color: Colors.redAccent, width: 1)),
    //     child: Align(
    //       alignment: Alignment.center,
    //       child: Text(text),
    //     ),
    //   ),
    // );
  }
}
