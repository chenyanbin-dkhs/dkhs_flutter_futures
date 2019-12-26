import 'package:flutter/material.dart';

class EllipsisText extends StatelessWidget {
  final String text;
  const EllipsisText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      maxLines: 1,
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
