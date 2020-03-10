import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/resources.dart';
import '../../ads/widgets/ads.dart';
import './instrument_grids.dart';

class InstrumentsReal extends StatefulWidget {
  InstrumentsReal({Key key}) : super(key: key);

  @override
  _InstrumentsRealState createState() => _InstrumentsRealState();
}

class _InstrumentsRealState extends State<InstrumentsReal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      key: PageStorageKey('real'),
      scrollDirection: Axis.vertical,
      padding: Gaps.defaultPadding,
      physics: AlwaysScrollableScrollPhysics(), //重要
      shrinkWrap: true, //重要
      children: <Widget>[
        AdsWidget(
          'futures_traders_banner',
          widgetType: AdsWidgetType.BANNER,
        ),
        Text("List Item"),
        InstrumentGrids(),
      ],
    );
  }
}
