import 'package:flutter/material.dart';
import '../../utils/image_utils.dart';
import '../../ads/widgets/ads.dart';
import '../../res/resources.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight =
        MediaQuery.of(context).padding.top + kToolbarHeight;
    return Stack(
      children: <Widget>[
        Center(
          child: ImageUtils.getImage("home/bg_main_banner"),
        ),
        Positioned(
          top: statusBarHeight + Dimens.gap_dp5,
          left: 0,
          right: 0,
          child: AdsWidget(
            'futures_tools_primary',
            gapWidth: 0,
            widgetType: AdsWidgetType.GRID_VIEW,
            needUpdate: true,
            isDarkTheme: true,
          ),
        ),
      ],
    );
  }
}
