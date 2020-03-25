import 'package:flutter/material.dart';
import '../../widgets/my_card.dart';
import '../../statuses/widgets/statuses_item_fake.dart';

class InstrumentGridItemFake extends StatelessWidget {
  const InstrumentGridItemFake({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MyCard(
        color: Theme.of(context).dividerColor,
        noPadding: true,
        child: StatusesItemFake());
  }
}
