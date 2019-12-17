import 'package:flutter/material.dart';
import '../../../utils/image_utils.dart';
import '../../ads/widgets/ads.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: ImageUtils.getImage("home/bg_main_banner"),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: AdsWidget(
            'futures_tools_primary',
            gapWidth: 30,
            widgetType: AdsWidgetType.GRID_VIEW,
            needUpdate: true,
            isDarkTheme: true,
          ),
        ),
      ],
    );
  }
}
