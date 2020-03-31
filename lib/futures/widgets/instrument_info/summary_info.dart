import 'package:flutter/material.dart';
import '../../models/instrument_quote.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/finance_text.dart';
import '../../../res/gaps.dart';

class InstrumentSummaryInfo extends StatelessWidget {
  const InstrumentSummaryInfo(this.instrumentQuote, {Key key})
      : super(key: key);
  final InstrumentQuote instrumentQuote;

  @override
  Widget build(BuildContext context) {
    var quote = this.instrumentQuote;
    var price = quote?.price ?? '';
    var percentage = quote?.percentage;
    var delta = quote?.delta;
    var pre = quote?.pre;

    var ask1 = quote?.ask1;
    var askv1 = quote?.askv1;
    var askBalance = double.tryParse(ask1) ?? 0 - double.tryParse(pre) ?? 0;

    var bid1 = quote?.bid1;
    var bidv1 = quote?.bidv1;
    var bidBalance = double.tryParse(bid1) ?? 0 - double.tryParse(pre) ?? 0;

    var openv = quote?.openv;
    var deltav = quote?.deltav;

    return Row(
      children: [
        Expanded(
          child: Row(children: [
            FinanceText(
              price,
              size: TextSizeType.xxLarge,
              colorable: true,
              balance: percentage,
            ),
            Gaps.hGap5,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FinanceText(
                delta,
                colorable: true,
                balance: percentage,
                size: TextSizeType.small,
              ),
              Gaps.vGap4,
              FinanceText(
                percentage,
                colorable: true,
                percentable: true,
                size: TextSizeType.small,
              ),
            ])
          ]),
          flex: 1,
        ),
        Container(
          width: 95,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  MySmallText('卖价'),
                  Gaps.hGap4,
                  FinanceText(
                    ask1,
                    colorable: true,
                    balance: askBalance,
                    size: TextSizeType.small,
                  ),
                  Gaps.hGap4,
                  FinanceText(
                    askv1,
                    decimal: 0,
                    size: TextSizeType.small,
                  ),
                ],
              ),
              Gaps.vGap4,
              Row(
                children: <Widget>[
                  MySmallText('买价'),
                  Gaps.hGap5,
                  FinanceText(
                    bid1,
                    colorable: true,
                    balance: bidBalance,
                    size: TextSizeType.small,
                  ),
                  Gaps.hGap5,
                  FinanceText(
                    bidv1,
                    decimal: 0,
                    size: TextSizeType.small,
                  ),
                ],
              ),
            ],
          ),
        ),
        Gaps.hGap16,
        Container(
          width: 75,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  MySmallText('持仓'),
                  Gaps.hGap5,
                  FinanceText(
                    openv,
                    decimal: 0,
                    size: TextSizeType.small,
                  ),
                ],
              ),
              Gaps.hGap4,
              Row(
                children: <Widget>[
                  MySmallText('增仓'),
                  Gaps.hGap5,
                  FinanceText(
                    deltav,
                    decimal: 0,
                    size: TextSizeType.small,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
