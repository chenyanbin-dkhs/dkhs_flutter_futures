import 'package:flutter/cupertino.dart';
import '../../../widgets/segmented_tab.dart';
import '../../../models/futures/instrument_trade_type.dart';

final Map<InstrumentTradeType, Widget> tabWidgets =
    const <InstrumentTradeType, Widget>{
  InstrumentTradeType.real: Text('实盘捕猎'),
  InstrumentTradeType.simulate: Text('实盘模拟'),
  InstrumentTradeType.practise: Text('历史模拟'),
};

typedef void ValueChangedCallback(InstrumentTradeType item);

class InstrumentTypeTab extends StatefulWidget {
  InstrumentTypeTab(
      {Key key, @required this.onValueChanged, @required this.defaultValue})
      : super(key: key);
  final ValueChangedCallback onValueChanged;
  final InstrumentTradeType defaultValue;
  @override
  _InstrumentTypeTabState createState() => _InstrumentTypeTabState();
}

class _InstrumentTypeTabState extends State<InstrumentTypeTab> {
  @override
  Widget build(BuildContext context) {
    return SegmentedTab(
      children: tabWidgets,
      onValueChanged: (item) {
        widget.onValueChanged(item);
      },
      value: widget.defaultValue,
    );
  }
}
