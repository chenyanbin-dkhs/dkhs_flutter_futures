import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/instrument.dart';
import '../../widgets/my_header_bar.dart';
import '../../widgets/my_text.dart';
import '../../widgets/badge.dart';
import '../../widgets/finance_value.dart';

import '../../res/gaps.dart';
import '../websocket/socket_market_snap_provider.dart';

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
        titleWidget: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(widget.instrument.name),
                      Text(widget.instrument.code),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Badge(
                        '闭市中',
                        Colors.green,
                        fill: true,
                      ),
                      MySmallText('下次开市时间13:00'),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: Gaps.defaultPadding,
        child: Column(
          children: [
            Consumer<SocketMarketSnapProvider>(
              builder: (context, value, child) {
                var quote = value.quoteByCode(widget.instrument.code);
                var price = quote?.price ?? '';
                return Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        MyLargeText(price),
                        Gaps.hGap8,
                        Column(children: [
                          MyText('2'),
                          Gaps.vGap4,
                          MyText('2'),
                        ])
                      ]),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('1'),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text('1'),
                      flex: 1,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
