import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../res/resources.dart';
import '../../ads/widgets/ads.dart';
import './instrument_grids.dart';
import '../widgets/instrument_accounts.dart';
import '../../../models/futures/instrument.dart';
import '../../../widgets/my_button.dart';

enum CardType { grid, list }

class InstrumentsReal extends StatefulWidget {
  InstrumentsReal({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  _InstrumentsRealState createState() => _InstrumentsRealState();
}

class _InstrumentsRealState extends State<InstrumentsReal>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CardType currentCard = CardType.grid;
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
        InstrumentAccounts(),
        Row(
          children: [
            MyButton(child: Text('时常'), onPressed: () => {}),
            MyButton(
                type: ButtonType.primary,
                child: Text('时常'),
                onPressed: () => {}),
            MyButton(
                type: ButtonType.link, child: Text('时常'), onPressed: () => {}),
            MyButton(
                size: ButtonSize.large, child: Text('时常'), onPressed: () => {}),
            MyButton(
                size: ButtonSize.small, child: Text('时常'), onPressed: () => {}),
            MyButton(
              child: Text('时常'),
              onPressed: () => {},
              type: ButtonType.primary,
              isOutline: true,
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
