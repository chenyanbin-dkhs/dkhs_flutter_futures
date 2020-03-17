import 'dart:math' as DartMath;
import 'package:flutter/material.dart';

class Point {
  double x, y;
  Point(this.x, this.y);
}

class LineChartData {
  List<double> list;

  /// 完整的点数
  int _dataSize;

  LineChartData(List<double> list) {
    this.list = list;

    this._dataSize = list.length;
  }

  /// 总数据条数
  LineChartData dataSize(int value) {
    this._dataSize = value;
    return this;
  }

  double get min {
    if (this.list.length == 0) {
      return null;
    }
    return this.list.reduce(DartMath.min);
  }

  double get max {
    if (this.list.length == 0) {
      return null;
    }
    return this.list.reduce(DartMath.max);
  }

  double xScale(int index, double chartWidth) {
    if (this._dataSize == 0) {
      return 0;
    }
    final double eachWidth = chartWidth / (this._dataSize - 1);
    return index * eachWidth;
  }

  double yScale(double value, double chartHeight) {
    var scaleValue = scaleBetween(value, min, max);
    return chartHeight - (chartHeight * scaleValue / 100);
  }
}

const scaledMin = 0;
const scaledMax = 100;
double scaleBetween(unscaledNum, min, max) {
  return (scaledMax - scaledMin) * (unscaledNum - min) / (max - min) +
      scaledMin;
}
