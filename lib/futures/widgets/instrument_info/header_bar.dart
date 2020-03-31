import 'package:flutter/material.dart';
import '../../models/instrument.dart';
import '../../models/instrument_quote.dart';

import '../../../widgets/my_text.dart';
import '../../../widgets/badge.dart';

class InstrumentHeaderBar extends StatelessWidget {
  const InstrumentHeaderBar(this.instrument, this.instrumentQuote, {Key key})
      : super(key: key);
  final Instrument instrument;
  final InstrumentQuote instrumentQuote;

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
                  _buildQuoteStatus(context),
                  MySmallText(this.instrumentQuote.statusInfo),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuoteStatus(BuildContext context) {
    var statusDisplay = this.instrumentQuote.statusDisplay;
    var statusColor = this.instrumentQuote.isStatusRunning
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).textTheme.subtitle.color;

    return Badge(
      statusDisplay,
      statusColor,
      fill: true,
    );
  }
}
