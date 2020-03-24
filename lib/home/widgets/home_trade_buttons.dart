import 'package:flutter/material.dart';
import '../../res/resources.dart';
import '../../widgets/image_button.dart';

class HomeTradeButtons extends StatelessWidget {
  const HomeTradeButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    // double buttonWidth = (ScreenUtil.screenWidth) / 4;
    // double buttonHeight = buttonWidth * 0.357;

    return Padding(
      padding: Gaps.hPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 329.0 / 121.0,
              child: ImageButton(
                src: 'home/btn_real_trade',
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
          Gaps.hGap10,
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 329.0 / 121.0,
              child: ImageButton(
                src: 'home/btn_simulate_trade',
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
