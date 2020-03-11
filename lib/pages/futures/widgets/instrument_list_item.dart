import 'package:dkhs_flutter_futures/widgets/my_button.dart';
import 'package:flutter/material.dart';
import '../../../models/futures/instrument.dart';
import '../../../res/resources.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/my_card.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/clear_button.dart';

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
                    color: Colors.red,
                    child: Column(children: [
                      Text('图表'),
                    ]),
                  ),
                  Gaps.hGap15,
                  Container(
                    width: 80,
                    child: Column(children: [
                      MyText('3638.8'),
                      Gaps.vGap5,
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Text(
                          '+1.25%',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      )
                    ]),
                  )
                ])),
          )),
    );
  }
}
