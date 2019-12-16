import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './dimens.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap4 = const SizedBox(width: 4.0);
  static const Widget hGap5 = const SizedBox(width: Dimens.gap_dp5);
  static const Widget hGap8 = const SizedBox(width: 8.0);
  static const Widget hGap10 = const SizedBox(width: Dimens.gap_dp10);
  static const Widget hGap12 = const SizedBox(width: 12.0);
  static const Widget hGap15 = const SizedBox(width: Dimens.gap_dp15);
  static const Widget hGap16 = const SizedBox(width: Dimens.gap_dp16);

  /// 垂直间隔
  static const Widget vGap4 = const SizedBox(height: 4.0);
  static const Widget vGap5 = const SizedBox(height: Dimens.gap_dp5);
  static const Widget vGap8 = const SizedBox(height: 8.0);
  static const Widget vGap10 = const SizedBox(height: Dimens.gap_dp10);
  static const Widget vGap12 = const SizedBox(height: 12.0);
  static const Widget vGap15 = const SizedBox(height: Dimens.gap_dp15);
  static const Widget vGap16 = const SizedBox(height: Dimens.gap_dp16);
  static const Widget vGap50 = const SizedBox(height: Dimens.gap_dp50);

  static const EdgeInsetsGeometry defaultPadding = const EdgeInsets.symmetric(
      horizontal: Dimens.gap_dp15, vertical: Dimens.gap_dp10);

  static const EdgeInsetsGeometry vPadding5 =
      const EdgeInsets.symmetric(vertical: Dimens.gap_dp5);

       static const EdgeInsetsGeometry vPadding8 =
      const EdgeInsets.symmetric(vertical: Dimens.gap_dp8);
//  static Widget line = const SizedBox(
//    height: 0.6,
//    width: double.infinity,
//    child: const DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
//  );

  static Widget line = const Divider();

  static const Widget empty = const SizedBox();
}
