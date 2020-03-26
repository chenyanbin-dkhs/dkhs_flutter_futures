import 'dart:math' as DartMath;

class Point {
  double x, y;
  Point(this.x, this.y);
}

class LineChartData {
  List<double> list = [];

  /// 完整的点数
  int _dataSize = 0;

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
    return this.list.where((item) => item != null).reduce(DartMath.min);
  }

  double get max {
    if (this.list.length == 0) {
      return null;
    }
    return this.list.where((item) => item != null).reduce(DartMath.max);
  }

  double xScale(int index, double chartWidth) {
    if (this._dataSize == 0) {
      return 0;
    }
    final double eachWidth = chartWidth / (this._dataSize - 1);
    return index * eachWidth;
  }

  double yScale(double value, double chartHeight) {
    if (value == null) {
      return null;
    }
    var scaleValue = scaleBetween(value, min, max);
    return chartHeight - (chartHeight * scaleValue / 100);
  }
}

const scaledMin = 0;
const scaledMax = 100;
double scaleBetween(unscaledNum, min, max) {
  if (min == max) {
    max += max.abs() * 0.01;
    min -= min.abs() * 0.01;
  }
  return (scaledMax - scaledMin) * (unscaledNum - min) / (max - min) +
      scaledMin;
}
