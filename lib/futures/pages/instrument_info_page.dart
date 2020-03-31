import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/instrument.dart';
import '../../widgets/my_header_bar.dart';
import '../../widgets/my_text.dart';
import '../../widgets/badge.dart';
import '../../widgets/finance_text.dart';

import '../../res/gaps.dart';
import '../websocket/socket_market_snap_provider.dart';
import '../widgets/instrument_info/summary_info.dart';
import '../widgets/instrument_info/header_bar.dart';

class InstrumentInfo extends StatefulWidget {
  InstrumentInfo(this.instrument, {Key key}) : super(key: key);
  final Instrument instrument;
  @override
  _InstrumentInfoState createState() => _InstrumentInfoState();
}

class _InstrumentInfoState extends State<InstrumentInfo> {
  GlobalKey _scaffold = GlobalKey();

  @override
  void dispose() {
    //SocketMarketSnapProvider().closeWebSocket();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      // Provider.of<SocketMarketSnapProvider>(_scaffold.currentContext,
      //         listen: false)
      //     .requestQuotes([widget.instrument.code]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: MyHeaderBar(
        titleWidget: InstrumentHeaderBar(widget.instrument),
      ),
      body: SingleChildScrollView(
        padding: Gaps.defaultPadding,
        child: Column(
          children: [
            Consumer<SocketMarketSnapProvider>(
              builder: (context, value, child) {
                var quote = value.quoteByCode(widget.instrument.code);
                return InstrumentSummaryInfo(quote);
              },
            ),
          ],
        ),
      ),
    );
  }
}
