import 'package:flutter/material.dart';
import '../../../widgets/async_loader.dart';
import '../../../http/futures_http.dart';
import '../../../models/futures/instrument.dart';
import './instrument_grid_item.dart';
import './instrument_grid_item_fake.dart';

class InstrumentGrids extends StatelessWidget {
  const InstrumentGrids({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncLoader(
      init: () async => await FuturesHttp.fetchFuturesInstruments(),
      loading: () => _buildLoadingList(),
      success: ({data}) => _buildList(data.results),
      error: ([error]) => Center(child: Text(error.toString())),
    );
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
      ...list.map((item) => InstrumentGridItem(
            instrument: item,
          ))
    ]);
  }

  Widget _buildLoadingList() {
    return _gridViewWrapper([
      ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(
        (item) => InstrumentGridItemFake(),
      )
    ]);
  }
}
