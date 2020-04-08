import 'package:flutter/material.dart';

class InstrumentChartType extends StatefulWidget {
  InstrumentChartType({Key key}) : super(key: key);

  @override
  _InstrumentChartTypeState createState() => _InstrumentChartTypeState();
}

class _InstrumentChartTypeState extends State<InstrumentChartType> {
  final List<String> _tabValues = [
    '分时',
    '1分',
    '5分',
    '15分',
    '日K',
    '盘口',
  ];

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: _tabValues.map((f) {
            return Text(f);
          }).toList(),
          controller: _controller,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
        ),
        Container(
          height: 200,
          child: TabBarView(
            physics:NeverScrollableScrollPhysics(),
            controller: _controller,
            
            children: _tabValues.map((f) {
              return Center(
                child: Text(f),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
