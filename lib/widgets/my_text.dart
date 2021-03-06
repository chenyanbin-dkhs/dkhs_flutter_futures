import 'package:flutter/material.dart';
import '../res/resources.dart';

enum TextSizeType { tiny, small, def, large, xLarge, xxLarge }

enum TextColorType { def, light, muted }

class MyText extends StatelessWidget {
  final String text;
  final TextSizeType size;
  final bool bold;
  final int maxLines;
  final Color color;

  const MyText(this.text,
      {Key key,
      this.size = TextSizeType.def,
      this.bold = false,
      this.maxLines = 2,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = buildMyTextSize(this.size);
    final textTheme = Theme.of(context).textTheme;
    final fontColor = this.color ?? _buildColor(textTheme, this.size);
    String display = this.text;
    if (this.text == null || this.text.isEmpty) {
      display = '';
    }
    return Text(
      display,
      maxLines: this.maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: this.bold ? FontWeight.w500 : FontWeight.w400),
    );
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

double buildMyTextSize(TextSizeType sizeType) {
  switch (sizeType) {
    case TextSizeType.tiny:
      return Dimens.font_sp10;
    case TextSizeType.small:
      return Dimens.font_sp12;
    case TextSizeType.large:
      return Dimens.font_sp16;
    case TextSizeType.xLarge:
      return Dimens.font_sp18;
    case TextSizeType.xxLarge:
      return Dimens.font_sp20;
    default:
      return Dimens.font_sp14;
  }
}

class MySmallText extends StatelessWidget {
  final String text;
  final Color color;

  const MySmallText(this.text, {Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyText(
      this.text,
      size: TextSizeType.small,
      color: this.color,
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
