import 'package:flutter/cupertino.dart';
import '../../../res/resources.dart';
import '../../ads/widgets/ads.dart';

class InstrumentsReal extends StatefulWidget {
  InstrumentsReal({Key key}) : super(key: key);

  @override
  _InstrumentsRealState createState() => _InstrumentsRealState();
}

class _InstrumentsRealState extends State<InstrumentsReal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: PageStorageKey('real'),
      padding: Gaps.defaultPadding,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AdsWidget(
            'futures_traders_banner',
            widgetType: AdsWidgetType.BANNER,
          ),
          Text('data'),
        ],
      ),
    );
  }
}
