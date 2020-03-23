import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/futures/instrument.dart';
import '../../../widgets/my_button.dart';
import '../../../res/resources.dart';

import '../../ads/widgets/ads.dart';

import './instrument_accounts.dart';
import './instrument_grids.dart';
import './instrument_list.dart';

enum CardType { grid, list }

class InstrumentsReal extends StatefulWidget {
  InstrumentsReal({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  _InstrumentsRealState createState() => _InstrumentsRealState();
}

class _InstrumentsRealState extends State<InstrumentsReal>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CardType currentCard = CardType.grid;

  @override
  void initState() {
    super.initState();
  }

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
            _buildCardTypeButton(CardType.grid),
            Gaps.hGap5,
            _buildCardTypeButton(CardType.list),
          ],
        ),
        Visibility(
          visible: currentCard == CardType.grid,
          child: InstrumentGrids(
            list: widget.list,
          ),
        ),
        Visibility(
          visible: currentCard == CardType.list,
          child: InstrumentList(
            list: widget.list,
          ),
        ),
      ],
    );
  }

  Widget _buildCardTypeButton(CardType type) {
    bool isCardGrid = type == CardType.grid;
    return MyButton(
      child: Text(isCardGrid ? '简约' : '专业'),
      isOutline: currentCard == type,
      onPressed: () {
        if (currentCard != type) {
          setState(() {
            currentCard = type;
          });
        }
      },
    );
  }
}
