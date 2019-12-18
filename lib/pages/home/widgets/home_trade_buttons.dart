import 'package:flutter/material.dart';
import '../../../utils/image_utils.dart';
import '../../../widgets/load_image.dart';
import '../../../res/resources.dart';

class HomeTradeButtons extends StatelessWidget {
  const HomeTradeButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.hPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () => {},
                child: LoadAssetImage(
                  "home/btn_real_trade",
                )),
          ),
          Gaps.hGap10,
          Expanded(
            flex: 1,
            child: InkWell(
                onTap: () => {},
                child: LoadAssetImage(
                  "home/btn_simulate_trade",
                )),
          ),
        ],
      ),
    );
  }
}
