import 'package:flutter/material.dart';
import '../models/instrument.dart';
import '../../widgets/my_header_bar.dart';
import '../../widgets/my_icon_button.dart';


class InstrumentInfo extends StatefulWidget {
  InstrumentInfo(this.instrument, {Key key}) : super(key: key);
  final Instrument instrument;
  @override
  _InstrumentInfoState createState() => _InstrumentInfoState();
}

class _InstrumentInfoState extends State<InstrumentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHeaderBar(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.instrument.name),
            Text(widget.instrument.code)
          ],
        ),
        actions: <Widget>[
          MyIconButton(
            src: 'common/ic_assistant',
          ),
          MyIconButton(
            src: 'common/ic_message',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text(widget.instrument.name)],
        ),
      ),
    );
  }
}
