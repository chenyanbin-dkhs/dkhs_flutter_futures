import 'package:dkhs_flutter_futures/widgets/my_header_bar.dart';
import 'package:flutter/material.dart';
import '../../models/futures/instrument_trade_type.dart';
import '../../widgets/my_tab_bar.dart';
import './widgets/instruments_real.dart';
import '../../widgets/async_loader.dart';
class InstrumentsPage extends StatefulWidget {
  InstrumentsPage({Key key}) : super(key: key);

  @override
  _InstrumentsPageState createState() => _InstrumentsPageState();
}

class _InstrumentsPageState extends State<InstrumentsPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: InstrumentTradeType.values.length,
        initialIndex: InstrumentTradeType.real.index);

    // _tabController.addListener(() {
    //   _switchPage(InstrumentTradeType.values[_tabController.index]);
    // });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var _tabs = MyTabBar(
      controller: _tabController,
      tabs: ['实盘捕猎', '实盘模拟', '历史模拟'],
    );
    return Scaffold(
      appBar: MyHeaderBar(
        titleWidget: Center(child: _tabs),
      ),
      body: TabBarView(controller: _tabController, children: [
        InstrumentsReal(),
        Center(child: Text('123')),
        Center(child: Text('123')),
      ]),
    );
  }
}
