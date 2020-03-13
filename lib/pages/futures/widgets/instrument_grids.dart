import 'package:flutter/material.dart';
import '../../../models/futures/instrument.dart';
import './instrument_grid_item.dart';
import './instrument_grid_item_fake.dart';

class InstrumentGrids extends StatelessWidget {
  const InstrumentGrids({Key key, @required this.list}) : super(key: key);
  final List<Instrument> list;
  @override
  Widget build(BuildContext context) {
    if (list == null || list.isEmpty) {
      return _buildLoadingList();
    } else {
      return _buildList(this.list);
    }
  }

  Widget _gridViewWrapper(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 2.15, // 控制子组件的高度
      physics: ClampingScrollPhysics(), //重要
      shrinkWrap: true, //重要
      primary: false,

      children: children,
    );
  }

  Widget _buildList(List<Instrument> list) {
    return _gridViewWrapper([
      for (var item in list)
        InstrumentGridItem(
          instrument: item,
        )
    ]);
  }

  Widget _buildLoadingList() {
    return _gridViewWrapper(
        [for (var item in List(10)) InstrumentGridItemFake()]);
  }
}
