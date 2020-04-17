import 'package:flutter/material.dart';
import './canvas_text.dart';

const fontHeight = 14.0;

class YAxis {
  Canvas canvas;
  double height;
  YAxis(this.canvas, this.height);

  void draw(List<double> values) {
    //for (final value in values) {}
    final size = values.length;
    if (size > 0) {
      for (int i = 0; i < size; i++) {
        CanvasText(values[i].toString(), 0, _yPosition(height, size, i))
            .draw(canvas);
      }
    }
  }

  void drawPercentage(List<double> values) {
    final size = values.length;
    if (size > 0) {
      for (int i = 0; i < size; i++) {
        CanvasText(
          values[i].toStringAsFixed(2) + '%',
          0,
          _yPosition(height, size, i),
          color: _color(size, i),
        ).draw(canvas);
      }
    }
  }
}

double _yPosition(double height, int size, int index) {
  final tickHeight = height / (size - 1);
  final offset =
      index == 0 ? 0 : index == size - 1 ? fontHeight : fontHeight / 2;
  return index * tickHeight - offset;
}

Color _color(int size, int index) {
  if (index < (size - 1) / 2) {
    return Colors.red;
  } else if (index > (size - 1) / 2) {
    return Colors.green;
  }
  return Colors.black;
}
