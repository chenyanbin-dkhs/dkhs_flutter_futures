import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/futures/instrument.dart';
import '../../../websocket/socket_market_snap_provider.dart';

import './instrument_list_item.dart';

class InstrumentList extends StatefulWidget {
  const InstrumentList({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;

  @override
  _InstrumentListState createState() => _InstrumentListState();
}

class _InstrumentListState extends State<InstrumentList> {
  @override
  void initState() {
    super.initState();
    List<String> codes = widget.list.map((item) => item.code).toList();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      Provider.of<SocketMarketSnapProvider>(context, listen: false)
          .requestQuotes(codes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...widget.list.map((item) => InstrumentListItem(
            instrument: item,
          ))
    ]);
  }
}
