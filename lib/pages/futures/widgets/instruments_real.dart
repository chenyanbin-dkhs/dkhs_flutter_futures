import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/futures/instrument.dart';
import '../../../widgets/my_button.dart';
import '../../../res/resources.dart';

import '../../ads/widgets/ads.dart';

import './instrument_accounts.dart';
import './instrument_grids.dart';
import './instrument_list.dart';
import './instrument_grid_list_switch.dart';

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
  int typeIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var screenWidth = MediaQuery.of(context).size.width;

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
        InstrumentGridListSwittch(onCardChange),
        Container(
          color: Colors.red,
          height: typeIndex == 0 ? 960 : 1540,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                child: InstrumentGrids(
                  list: widget.list,
                ),
                width: screenWidth,
                transform: Matrix4.translationValues(
                    typeIndex == 0 ? 0 : -screenWidth, 0, 0),
                duration: Duration(milliseconds: 10),
                curve: Curves.easeIn,
              ),
              AnimatedContainer(
                child: InstrumentList(
                  list: widget.list,
                ),
                width: screenWidth,
                transform: Matrix4.translationValues(
                    typeIndex == 1 ? 0 : screenWidth, 0, 0),
                duration: Duration(milliseconds: 10),
                curve: Curves.easeIn,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onCardChange(int index) {
    setState(() {
      typeIndex = index;
    });
    // _pagecontroller.animateToPage(index,
    //     duration: const Duration(milliseconds: 1), curve: Curves.ease);
  }
}
