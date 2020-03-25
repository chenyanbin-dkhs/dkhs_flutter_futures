import 'package:dkhs_flutter_futures/widgets/my_button.dart';
import 'package:flutter/material.dart';
import '../models/instrument.dart';
import '../../res/resources.dart';

import '../../widgets/chart/line_chart/index.dart';
import '../../widgets/badge.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_card.dart';
import '../../widgets/clear_button.dart';
import '../../widgets/finance_value.dart';
import 'package:provider/provider.dart';
import '../websocket/socket_market_snap_provider.dart';
import '../websocket/socket_market_time_line_provider.dart';
import '../../utils/number_util.dart';

class InstrumentListItem extends StatelessWidget {
  const InstrumentListItem({Key key, @required this.instrument})
      : super(key: key);
  final Instrument instrument;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: MyCard(
          color: Theme.of(context).dividerColor,
          noPadding: true,
          child: ClearButton(
            onTap: () => {},
            child: Container(
                padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyLargeText(instrument.name),
                      Gaps.vGap5,
                      Row(
                        children: [
                          MySmallText(instrument.code),
                          Gaps.hGap5,
                          Badge('日盘', Colours.positiveColor),
                          Badge('夜盘', Colours.blue),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 120,
                    padding: EdgeInsets.all(2),
                    child: _buildTimeline(),
                  ),
                  Gaps.hGap15,
                  Container(
                    width: 80,
                    child: _buildPrice(),
                  ),
                ])),
          )),
    );
  }

  Widget _buildPrice() {
    return Consumer<SocketMarketSnapProvider>(
      builder: (context, value, child) {
        var quote = value.quoteByCode(this.instrument.code);

        return Column(children: [
          FinanceValue(quote?.price),
          Gaps.vGap5,
          FinanceValue(
            quote?.percentage,
            percentable: true,
            colorable: true,
            onBuild: ({text, value, color}) => Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              width: 70,
              color: color,
            ),
          ),
        ]);
      },
    );
  }

  Widget _buildTimeline() {
    return Consumer<SocketMarketTimeLineProvider>(
      builder: (context, value, child) {
        var instrument = value.getInstrument(this.instrument.code);
        var isPercentagePositive =
            value.instrumentPercentageMap[this.instrument.code];
        if (instrument != null && isPercentagePositive != null) {
          Color color = financeColor(context, isPercentagePositive ? 1 : -1);

          return new LineChartSimple(
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
