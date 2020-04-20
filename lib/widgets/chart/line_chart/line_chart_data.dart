import 'dart:math' as DartMath;
import 'package:tuple/tuple.dart';

enum DataDomainType { auto, startZero, middleZero }

class LineChartData {
  List<double> list;

  double min;
  double max;
  DataDomainType domainType;

  int yTickSize;

  LineChartData(List<double> list,
      {int yTickSize = 5, DataDomainType domainType = DataDomainType.auto}) {
    this.yTickSize = yTickSize;
    this.list = list;
    this.domainType = domainType;
    Tuple2<double, double> _minAndMaxValues = _getMinAndMaxValues();
    this.min = _minAndMaxValues?.item1;
    this.max = _minAndMaxValues?.item2;
  }

  //http://58.23.5.118:8100/browse/PORTFOLIO-20236
  Tuple2<double, double> _getMinAndMaxValues() {
    if (list == null || list.length == 0) {
      return new Tuple2(null, null);
    }

    var _max = list.where((item) => item != null).reduce(DartMath.max);
    var _min = list.where((item) => item != null).reduce(DartMath.min);

    if (_max == _min) {
      const diffPercent = 0.05;
      _max += _max.abs() * diffPercent;
      _min -= _min.abs() * diffPercent;
    }

    final diffValue = _max - _min;
    final w = diffValue.abs() * 1.1;
    final step = w / (yTickSize - 1);

    double finalyMax = _max + 0.05 * (_max - _min);
    double finalyMin = finalyMax - (yTickSize - 1) * step;

    /// 中间是0，上下对称
    if (domainType == DataDomainType.middleZero) {
      if (finalyMax.abs() > finalyMin.abs()) {
        finalyMin = 0 - finalyMax.abs();
      } else {
        finalyMax = finalyMin.abs();
      }
    } else if (domainType == DataDomainType.startZero) {
      finalyMax = finalyMax.abs();
      finalyMin = 0;
    }

    return new Tuple2(finalyMin, finalyMax);
  }

  int get _dataSize {
    return this.list?.length ?? 0;
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

  List<double> get tickValues {
    final List results = new List(yTickSize);

    final diffValue = max - min;
    final step = diffValue.abs() / (yTickSize - 1);

    final List<double> values = [];
    for (int i = 0; i < results.length; i++) {
      values.add(max - (step * i));
    }
    return values;
  }
}

const scaledMin = 0;
const scaledMax = 100;

double scaleBetween(unscaledNum, min, max) {
  return (scaledMax - scaledMin) * (unscaledNum - min) / (max - min) +
      scaledMin;
}
