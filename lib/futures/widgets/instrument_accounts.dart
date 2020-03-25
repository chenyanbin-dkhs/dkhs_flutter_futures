import 'package:flutter/material.dart';
import '../../widgets/image_container.dart';
import '../../widgets/my_text.dart';

import '../../res/resources.dart';

class InstrumentAccounts extends StatelessWidget {
  const InstrumentAccounts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Gaps.vPadding10,
        child: ImageContainer(
          src: 'futures/trade_account_bg',
          height: 50,
          child: Padding(
            padding: Gaps.hPadding,
            child: Row(children: [
              MyText(
                '资金帐号：',
                color: Colors.white,
              ),
              Gaps.vGap5,
              MyText(
                '123567',
                color: Colors.white,
              ),
              Spacer(flex: 1),
              MySmallText(
                '查看更多',
                color: Colors.white,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 14.0,
              )
            ]),
          ),
        ));
  }
}
