import 'package:flutter/material.dart';

import '../models/instrument.dart';
import '../../res/resources.dart';

import '../../ads/widgets/ads.dart';

import './instrument_accounts.dart';
import './instrument_grids.dart';
import './instrument_list.dart';
import './instrument_grid_list_switch.dart';

class InstrumentsSimulate extends StatefulWidget {
  InstrumentsSimulate({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  _InstrumentsSimulateState createState() => _InstrumentsSimulateState();
}

class _InstrumentsSimulateState extends State<InstrumentsSimulate>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int typeIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double gridHeight = (widget.list.length / 2).round() * 96.0;
    final double listHeight = widget.list.length * 77.0;
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: Gaps.defaultPadding,
      child: Column(children: [
        AdsWidget(
          'futures_virtual_traders_banner',
          widgetType: AdsWidgetType.BANNER,
        ),
        InstrumentAccounts(),
        InstrumentGridListSwittch(onCardChange),
        Container(
          height: typeIndex == 0 ? gridHeight : listHeight,
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
              ),
              AnimatedContainer(
                child: InstrumentList(
                  list: widget.list,
                ),
                width: screenWidth,
                transform: Matrix4.translationValues(
                    typeIndex == 1 ? 0 : screenWidth, 0, 0),
                duration: Duration(milliseconds: 10),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void onCardChange(int index) {
    setState(() {
      typeIndex = index;
    });
  }
}
