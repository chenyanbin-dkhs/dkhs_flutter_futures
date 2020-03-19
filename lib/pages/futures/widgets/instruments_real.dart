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
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
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

        Offstage(
          offstage: currentCard != CardType.grid,
          child: InstrumentGrids(
            list: widget.list,
          ),
        ),
        Offstage(
          offstage: currentCard != CardType.list,
          child: InstrumentList(
            list: widget.list,
          ),
        ),
        // Column(
        //   children: <Widget>[
        //     TabBarView(
        //       children: [
        //         InstrumentGrids(
        //           list: widget.list,
        //         ),
        //         InstrumentList(
        //           list: widget.list,
        //         ),
        //       ],
        //       controller: _tabController,
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildCardTypeButton(CardType type) {
    return MyButton(
      child: Text(type == CardType.grid ? '简约' : '专业'),
      isOutline: currentCard == type,
      onPressed: () => {
        if (currentCard != type)
          {
            setState(() {
              currentCard = type;
            })
          }
      },
    );
  }
}
