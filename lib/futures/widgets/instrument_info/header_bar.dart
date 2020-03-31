import 'package:flutter/material.dart';
import '../../models/instrument.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/badge.dart';

class InstrumentHeaderBar extends StatelessWidget {
  const InstrumentHeaderBar(this.instrument, {Key key}) : super(key: key);
  final Instrument instrument;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: <Widget>[
                  Text(this.instrument.name),
                  Text(this.instrument.code),
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
    );
  }
}
