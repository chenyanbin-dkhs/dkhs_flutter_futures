import 'package:flutter/material.dart';
import '../res/resources.dart';
import './my_text.dart';

class ListHeader extends StatelessWidget {
  final bool showLeading;
  final String title;
  final String subTitle;
  final String note;
  final double height;
  const ListHeader(
      {Key key,
      @required this.title,
      this.subTitle,
      this.note,
      this.height = 44.0,
      this.showLeading = false}) // 每行高度默认为44
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      padding: Gaps.defaultPadding,
      child: Row(
        children: <Widget>[
          getLeading(this.showLeading),
          MyLargeText(this.title),
          getSubTitle(this.subTitle),
          Spacer(),
          getNote(this.note),
        ],
      ),
    );
  }

  Widget getLeading(bool isShow) {
    if (isShow == false) {
      return SizedBox();
    }
    return Row(
      children: <Widget>[
        Container(
          width: 2.5,
          height: 14,
          color: Colors.red, // todo primary color
        ),
        Gaps.hGap5,
      ],
    );
  }

  Widget getSubTitle(String title) {
    if (title == null) {
      return SizedBox();
    }

    return Row(
      children: <Widget>[
        Gaps.hGap5,
        MySmallText(
          title,
        ),
      ],
    );
  }

  Widget getNote(String title) {
    if (title == null) {
      return SizedBox();
    }

    return Row(
      children: <Widget>[
        MySmallText(
          title,
        ),
      ],
    );
  }
}
