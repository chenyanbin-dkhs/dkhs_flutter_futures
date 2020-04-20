import 'package:flutter/material.dart';

/* 
  
  new CanvasText('12.22%', 0, 0).draw(canvas);
 */
class CanvasText {
  String text;
  double x;
  double y;
  Color color;
  TextAlign textAlign;
  double fontSize;

  CanvasText(this.text, this.x, this.y,
      {this.color = Colors.black,
      this.textAlign = TextAlign.left,
      this.fontSize = 10.0});

  TextSpan get _span {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),
    );
  }

  TextPainter get _painter {
    return TextPainter(
      text: _span,
      textAlign: textAlign,
      textDirection: TextDirection.ltr,
    );
  }

  void draw(Canvas canvas) {
    TextPainter tp = _painter;
    tp.layout();
    tp.paint(canvas, new Offset(x, y));
  }
}
