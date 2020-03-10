import 'package:dkhs_flutter_futures/widgets/my_header_bar.dart';
import 'package:flutter/material.dart';
import '../../models/futures/instrument_trade_type.dart';
import './widgets/instruments_real.dart';
import './widgets/instrument_types_tab.dart';

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

    return Scaffold(
      appBar: MyHeaderBar(
        titleWidget: Center(
            child: InstrumentTypesTab(
          controller: _tabController,
        )),
      ),
      body: TabBarView(controller: _tabController, children: [
        InstrumentsReal(),
        Center(child: Text('123')),
        Center(child: Text('123')),
      ]),
    );
  }
}
