import 'package:flutter/material.dart';

class StyleColorUtils {
  static final primaryBgColor = Color.fromRGBO(22, 37, 58, 1); //主深色调
  static final bodyColor = Color.fromRGBO(17, 30, 48, 1); //页面背景颜色
  static final dividerColor = Color.fromRGBO(47, 59, 77, 1); //分隔线颜色
}

abstract class StyleTextUtils {
  static const TextStyle primaryTitle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle subTitle = TextStyle(
    color: Color.fromRGBO(97, 113, 133, 1),
    fontSize: 12,
  );
}
