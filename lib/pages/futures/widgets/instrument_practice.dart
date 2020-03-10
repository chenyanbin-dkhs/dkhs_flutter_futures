import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/resources.dart';
import '../../ads/widgets/ads.dart';
import './instrument_grids.dart';
import '../widgets/instrument_accounts.dart';
import '../../../models/futures/instrument.dart';

class InstrumentsPractice extends StatefulWidget {
  InstrumentsPractice({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  _InstrumentsPracticeState createState() => _InstrumentsPracticeState();
}

class _InstrumentsPracticeState extends State<InstrumentsPractice>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView(
      key: PageStorageKey('practice'),
      scrollDirection: Axis.vertical,
      padding: Gaps.defaultPadding,
      physics: AlwaysScrollableScrollPhysics(), //重要
      shrinkWrap: true, //重要
      children: <Widget>[
        AdsWidget(
          'futures_practice_banner',
          widgetType: AdsWidgetType.BANNER,
        ),
        InstrumentAccounts(),
        Row(
          children: [
            RaisedButton(
              onPressed: () => {},
              child: Text('data'),
            ),
          ],
        ),
        InstrumentGrids(
          list: widget.list,
        ),
      ],
    );
  }
}
