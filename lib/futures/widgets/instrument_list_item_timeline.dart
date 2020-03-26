import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../websocket/socket_market_time_line_provider.dart';
import '../../widgets/finance_value.dart';
import '../../widgets/chart/line_chart/index.dart';

class InstrumentListItemTimeline extends StatelessWidget {
  const InstrumentListItemTimeline(this.code, {Key key}) : super(key: key);
  final String code;
  @override
  Widget build(BuildContext context) {
    return Consumer<SocketMarketTimeLineProvider>(
      builder: (context, value, child) {
        var instrument = value.getInstrument(this.code);
        var isPercentagePositive = value.instrumentPercentageMap[this.code];
        if (instrument != null && isPercentagePositive != null) {
          Color color = financeColor(context, isPercentagePositive ? 1 : -1);
          
          return LineChartSimple(
            instrument.timeLinePrices,
            color: color,
            width: 120,
            height: 40,
          );
        }

        return SizedBox(
          width: 120,
          height: 40,
        );
      },
    );
  }
}
