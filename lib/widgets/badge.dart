import 'package:flutter/material.dart';
import '../res/resources.dart';

class Badge extends StatelessWidget {
  final String text;
  final Color color;
  final bool fill;

  const Badge(this.text, this.color, {Key key, this.fill = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color bgColor = this.fill ? this.color : Colors.transparent;
    Color textColor = this.fill ? Colors.white : this.color;
    Color borderColor = this.color;
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      margin: const EdgeInsets.only(right: 4.0),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(
          width: 0.5,
          color: borderColor,
        ),
      ),
      height: 17.0,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: Dimens.font_sp10),
      ),
    );
  }
}
