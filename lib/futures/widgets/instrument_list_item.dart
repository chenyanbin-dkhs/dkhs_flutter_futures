import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/instrument.dart';
import '../../res/resources.dart';

import '../../widgets/badge.dart';
import '../../widgets/my_text.dart';
import '../../widgets/my_card.dart';
import '../../widgets/clear_button.dart';
import '../../widgets/finance_text.dart';
import '../websocket/socket_market_snap_provider.dart';
import './instrument_list_item_timeline.dart';
import '../futures_router.dart';

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
            onTap: () {
              final spanProvider =
                  Provider.of<SocketMarketSnapProvider>(context, listen: false);
              FuturesRouter.goInstrumentInfo(context, instrument, spanProvider);
              // return Consumer<SocketMarketSnapProvider>(
              //   builder: (context, value, child) {
              //     return FuturesRouter.goInstrumentInfo(
              //         context, instrument, value);
              //   },
              // );
            },
            //onTap: () => {FuturesRouter.goInstrumentInfo(context, instrument)},
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
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.1,
                        color: Theme.of(context).textTheme.subtitle.color,
                      ),
                    ),
                    child: InstrumentListItemTimeline(instrument.code),
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
          FinanceText(quote?.price),
          Gaps.vGap5,
          FinanceText(
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
}
