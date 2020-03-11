import 'package:flutter/material.dart';

/// 主题类别
///
enum ThemeKeys {
  /// 默认白色主题
  light,

  /// 夜晚暗黑主题
  night,

  /// 卡通暗黑主题
  cartoon
}

/// 主题样式.
class MyThemes {
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,

      /// Toolbar、Tabbar 背景色
      primaryColor: Color(0xffffffff),
      primaryColorDark: Color(0xfff76836),

      /// 窗体背景颜色
      scaffoldBackgroundColor: Color(0xfffafafa),

      ///前景色
      accentColor: Color(0xff23252b),
      dividerColor: Color(0xffF5F5F5),
      textTheme: TextTheme(
        /// 默认文字
        body1: TextStyle(fontSize: 14.0, color: Color(0xff23252b)),
        subtitle: TextStyle(fontSize: 12.0, color: Color(0xff8f949d)),
      ),
      buttonTheme: ButtonThemeData(
          height: 22,
          minWidth: 10,
          buttonColor: Color(0xffEFEEF4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(4)),
          )),

      /// 顶部导航条样式
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),

          /// 导航条边框
          elevation: 0));

  static final ThemeData nightTheme = ThemeData(
    primaryColor: Color(0xff272829),
    brightness: Brightness.dark,
  );

  static final ThemeData cartoonTheme = ThemeData(
    primaryColor: Color(0xff272829),
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(ThemeKeys themeKey) {
    switch (themeKey) {
      case ThemeKeys.light:
        return lightTheme;
      case ThemeKeys.night:
        return nightTheme;
      case ThemeKeys.cartoon:
        return cartoonTheme;
      default:
        return lightTheme;
    }
  }
}
