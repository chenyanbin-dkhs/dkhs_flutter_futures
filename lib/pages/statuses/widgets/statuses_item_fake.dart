import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import '../../../res/resources.dart';

class StatusesItemFake extends StatelessWidget {
  const StatusesItemFake({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.defaultPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: PlaceholderLines(
              count: 3,
              align: TextAlign.left,
              lineHeight: 10,
            ),
          ),
          Container(
            // margin: EdgeInsets.only(right: 16),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.3),
            ),
            child: Center(
              child: Icon(
                Icons.photo_size_select_actual,
                color: Colors.white,
                size: 38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
