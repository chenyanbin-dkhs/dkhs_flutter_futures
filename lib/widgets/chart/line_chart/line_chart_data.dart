import 'dart:math' as DartMath;
import 'package:tuple/tuple.dart';

class Point {
  double x, y;
  Point(this.x, this.y);
}

class LineChartData {
  List<double> list = [];
  int yTickSize = 5;
  double min;
  double max;
  List<double> tickValues = [];

  /// 完整的点数
  int _dataSize = 0;

  LineChartData(List<double> list) {
    this.list = list;

    Tuple2<double, double> _minAndMaxValues = _getMinAndMaxValues(list);
    this.min = _minAndMaxValues?.item1;
    this.max = _minAndMaxValues?.item2;
    this._dataSize = list.length;
    this.tickValues = _calculateTickValues();
  }

  /// 总数据条数
  LineChartData dataSize(int value) {
    this._dataSize = value;

    return this;
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
    var scaleValue = scaleBetween(value, this.min, this.max);
    return chartHeight - (chartHeight * scaleValue / 100);
  }

  /// Y轴每个间隔的值
  double _calculateTickStep() {
    var diffValue = this.max - this.min;
    var w = diffValue.abs();
    var step = w / (yTickSize - 1);
    return step;
  }

  /// Y轴上面的刻度值
  List<double> _calculateTickValues() {
    var tickStep = _calculateTickStep();
    var values = new List<double>();
    for (var i = 0; i < yTickSize; i++) {
      values.add(this.max - tickStep * i);
    }
    return values;
  }

}

const scaledMin = 0;
const scaledMax = 100;
const offset = 0.01;

double scaleBetween(unscaledNum, min, max) {
  return (scaledMax - scaledMin) * (unscaledNum - min) / (max - min) +
      scaledMin;
}

Tuple2<double, double> _getMinAndMaxValues(List<double> list) {
  if (list == null || list.length == 0) {
    return new Tuple2(null, null);
  }
  var _max = list.where((item) => item != null).reduce(DartMath.max);
  var _min = list.where((item) => item != null).reduce(DartMath.min);
  if (_max == _min) {
    _max += _max.abs() * offset;
    _min -= _min.abs() * offset;
  }

  return new Tuple2(_min, _max);
}
