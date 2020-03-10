import 'package:flutter/material.dart';
import '../res/resources.dart';

enum TextSizeType { tiny, small, def, large }
enum TextColorType { def, light, muted }

class MyText extends StatelessWidget {
  final String text;
  final TextSizeType size;
  final bool bold;
  final int maxLines;
  const MyText(this.text,
      {Key key,
      this.size = TextSizeType.def,
      this.bold = false,
      this.maxLines = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = _buildSize(this.size);
    final textTheme = Theme.of(context).textTheme;
    final fontColor = _buildColor(textTheme, this.size);
    return Text(
      this.text,
      maxLines: this.maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: this.bold ? FontWeight.w500 : FontWeight.normal),
    );
  }

  double _buildSize(TextSizeType sizeType) {
    switch (sizeType) {
      case TextSizeType.tiny:
        return Dimens.font_sp10;
      case TextSizeType.small:
        return Dimens.font_sp12;
      case TextSizeType.large:
        return Dimens.font_sp16;
      default:
        return Dimens.font_sp14;
    }
  }

  Color _buildColor(TextTheme textTheme, TextSizeType sizeType) {
    switch (sizeType) {
      case TextSizeType.tiny:
      case TextSizeType.small:
        return textTheme.subtitle.color;
      default:
        return textTheme.body1.color;
    }
  }
}

class MySmallText extends StatelessWidget {
  final String text;

  const MySmallText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(
      this.text,
      size: TextSizeType.small,
    );
  }
}

class MyLargeText extends StatelessWidget {
  final String text;

  const MyLargeText(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(
      this.text,
      size: TextSizeType.large,
      bold: true,
    );
  }
}
