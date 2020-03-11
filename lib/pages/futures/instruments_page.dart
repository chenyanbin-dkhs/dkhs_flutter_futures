import 'package:flutter/material.dart';
import '../../models/futures/instrument_trade_type.dart';
import './widgets/instruments_real.dart';
import './widgets/instruments_simulate.dart';
import './widgets/instrument_practice.dart';

import './widgets/instrument_types_tab.dart';
import '../../widgets/async_loader.dart';
import '../../widgets/my_header_bar.dart';

import '../../http/futures_http.dart';

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

    var _asyncLoaderInstruments = AsyncLoader(
      init: () async => await FuturesHttp.fetchFuturesInstruments(),
      loading: () => Center(child: Text('loading')),
      success: ({data}) => TabBarView(controller: _tabController, children: [
        InstrumentsReal(list: data.results),
        InstrumentsSimulate(list: data.results),
        InstrumentsPractice(list: data.results),
      ]),
      error: ([error]) => Center(child: Text(error.toString())),
    );

    return Scaffold(
      appBar: MyHeaderBar(
        titleWidget: Center(
            child: InstrumentTypesTab(
          controller: _tabController,
        )),
      ),
      body: _asyncLoaderInstruments,
    );
  }
}
