import 'package:flutter/material.dart';
import '../../../models/futures/instrument.dart';
import './instrument_list_item.dart';

class InstrumentList extends StatelessWidget {
  const InstrumentList({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...this.list.map((item) => InstrumentListItem(
            instrument: item,
          ))
    ]);
  }
}
