import 'package:flutter/material.dart';
import './canvas_text.dart';
import './line_chart_data.dart';

const fontHeight = 12.5;

class YAxis {
  Canvas canvas;
  double height;
  YAxis(this.canvas, this.height);

  void draw(List<double> values) {
    // final size = values.length;
    // if (size > 0) {
    //   for (int i = 0; i < size; i++) {
    //     final text = values[i].toString();
    //     final y = _yPosition(height, size, i);
    //     CanvasText(text, 0, y).draw(canvas);
    //   }
    // }
  }
}

class YAxisPercentage extends YAxis {
  int decimal;

  YAxisPercentage(Canvas canvas, double height, {this.decimal = 2})
      : super(canvas, height);

  @override
  void draw(List<double> percentages) {
    final size = percentages.length;
    if (size > 0) {
      for (int i = 0; i < size; i++) {
        final percentage = _percentageText(percentages[i], decimal);
        final y = _yPosition(height, size, i, 1);
        final color = _color(percentages[i], 0);

        CanvasText(percentage, 0, y, color: color).draw(canvas);
      }
    }
  }
}

class YAxisPercentageAndValue extends YAxisPercentage {
  YAxisPercentageAndValue(Canvas canvas, double height) : super(canvas, height);

  @override
  void draw(List<double> percentages) {
    final size = percentages.length;

    if (size > 0) {
      for (int i = 0; i < size; i++) {
        final percentage = _percentageText(percentages[i], decimal);
        final y = _yPosition(height, size, i, 2);
        final color = _color(percentages[i], 0);

        CanvasText(percentage, 0, y, color: color).draw(canvas);

        CanvasText('12322.22', 0, y + fontHeight, color: color).draw(canvas);
      }
    }
  }
}

double _yPosition(
    double chartHeight, int tickSize, int index, int tickLabelHeight) {
  final tickHeight = chartHeight / (tickSize - 1);
  final baseOffset = tickLabelHeight * fontHeight;
  double yBase = index * tickHeight;

  final offset =
      index == 0 ? 0 : index == tickSize - 1 ? baseOffset : baseOffset / 2;
  return yBase - offset;
}

Color _color(double value, double compareValue) {
  if (value > compareValue) {
    return Colors.red;
  } else if (value < compareValue) {
    return Colors.green;
  }
  return Colors.black;
}

String _percentageText(double value, int decimal) {
  return value.toStringAsFixed(decimal) + '%';
}
