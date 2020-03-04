import 'package:flutter/material.dart';

class InstrumentsPage extends StatelessWidget {
  const InstrumentsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('InstrumentsPage');

    return Scaffold(
      appBar: AppBar(
        title: Text('交易'),
      ),
      body: Center(
        child: Text('交易'),
      ),
    );
  }
}
