import 'package:flutter/material.dart';
import '../res/resources.dart';

class Badge extends StatelessWidget {
  final String text;
  final Color color;
  const Badge(this.text, this.color, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      margin: const EdgeInsets.only(right: 4.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 0.5,
          color: color,
        ),
      ),
      height: 17.0,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: Dimens.font_sp10),
      ),
    );
  }
}
