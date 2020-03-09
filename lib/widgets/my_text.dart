import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  const MyText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
