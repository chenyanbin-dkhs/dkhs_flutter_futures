import 'package:flutter/material.dart';
import '../../../widgets/my_button.dart';
import '../../../res/resources.dart';

enum CardType { grid, list }
typedef ChangeCallback(int index);

class InstrumentGridListSwittch extends StatefulWidget {
  InstrumentGridListSwittch(this.onChange, {Key key}) : super(key: key);
  final ChangeCallback onChange;

  @override
  _InstrumentGridListSwittchState createState() =>
      _InstrumentGridListSwittchState();
}

class _InstrumentGridListSwittchState extends State<InstrumentGridListSwittch> {
  CardType currentCard = CardType.grid;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCardTypeButton(CardType.grid),
        Gaps.hGap5,
        _buildCardTypeButton(CardType.list),
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
          widget.onChange(type.index);
        }
      },
    );
  }
}
