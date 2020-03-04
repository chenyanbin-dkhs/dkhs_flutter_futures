import 'package:flutter/material.dart';
import '../../res/gaps.dart';

import './widgets/home_product_review.dart';
import './widgets/main_banner.dart';
import './widgets/home_app_bar.dart';
import './widgets/home_flash_statuses.dart';
import './widgets/home_trade_buttons.dart';

import '../ads/widgets/ads.dart';
import '../statuses/widgets/statuses_list.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double alpha;
  @override
  void initState() {
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollUpdateNotification && scrollInfo.depth == 0) {
      double _alpha = scrollInfo.metrics.pixels / APPBAR_SCROLL_OFFSET;
      if (_alpha < 0) {
        _alpha = 0;
      } else if (_alpha > 1) {
        _alpha = 1;
      }

      if (_alpha != this.alpha) {
        setState(() {
          alpha = _alpha;
        });
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MainBanner(),
                    HomeFlashStatuses(),
                    HomeTradeButtons(),
                    HomeProductReview(),
                    AdsWidget(
                      'futures_home_banner',
                      widgetType: AdsWidgetType.BANNER,
                      hasPadding: true,
                    ),
                    Statuseslist(),
                    Gaps.vGap10,
                  ],
                ),
              ),
              HomeAppBar(
                alpha: this.alpha,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
