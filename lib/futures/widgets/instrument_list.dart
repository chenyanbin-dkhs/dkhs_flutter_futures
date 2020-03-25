import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/instrument.dart';
import '../websocket/socket_market_snap_provider.dart';
import '../websocket/socket_market_time_line_provider.dart';

import './instrument_list_item.dart';

class InstrumentList extends StatefulWidget {
  const InstrumentList({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;

  @override
  _InstrumentListState createState() => _InstrumentListState();
}

class _InstrumentListState extends State<InstrumentList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    List<String> codes = widget.list.map((item) => item.code).toList();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Provider.of<SocketMarketSnapProvider>(context, listen: false)
          .requestQuotes(codes);

      Provider.of<SocketMarketTimeLineProvider>(context, listen: false)
          .requestTimelines(widget.list);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
        scrollDirection: Axis.vertical,
        physics:NeverScrollableScrollPhysics(), //重要
        shrinkWrap: true,
        children: [
          ...widget.list.map((item) => InstrumentListItem(
                instrument: item,
              ))
        ]);
  }
}
