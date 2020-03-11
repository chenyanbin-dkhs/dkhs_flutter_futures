import 'package:flutter/material.dart';
import '../../../models/futures/instrument.dart';
import '../../../res/resources.dart';

import '../../../widgets/badge.dart';
import '../../../widgets/my_text.dart';
import '../../../widgets/my_card.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/clear_button.dart';

class InstrumentGridItem extends StatelessWidget {
  const InstrumentGridItem({Key key, @required this.instrument})
      : super(key: key);
  final Instrument instrument;
  @override
  Widget build(BuildContext context) {
    return MyCard(
        color: Theme.of(context).dividerColor,
        noPadding: true,
        child: ClearButton(
          onTap: () => {},
          child: Stack(
            children: <Widget>[
              new Positioned(
                child: new LoadImage(
                  instrument.icon,
                  width: 115,
                  height: 60.5,
                  fit: BoxFit.fill,
                ),
                right: 0,
                top: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyLargeText(instrument.name),
                    Gaps.vGap5,
                    MySmallText(instrument.code),
                    Gaps.vGap5,
                    Row(
                      children: [
                        Badge('日盘', Colours.positiveColor),
                        Badge('夜盘', Colours.blue),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
