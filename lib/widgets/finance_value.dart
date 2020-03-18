import 'package:flutter/material.dart';
import '../res/colors.dart';

typedef Widget BuildCallback({String text, double value, Color color});

class FinanceValue extends StatelessWidget {
  const FinanceValue(this.value,
      {Key key,
      this.decimal = 2,
      this.error = '--',
      this.colorable = false,
      this.percentable = false,
      this.onBuild})
      : super(key: key);
  final dynamic value;
  final int decimal;
  final String error;
  final bool colorable;
  final bool percentable;
  final BuildCallback onBuild;

  @override
  Widget build(BuildContext context) {
    String displayValue = '';

    var _value = double.tryParse(this.value.toString()) ?? null;
    if (_value == null) {
      displayValue = this.error;
    } else {
      displayValue = _value.toStringAsFixed(this.decimal);
      if (this.percentable) {
        displayValue += '%';
      }
    }
    var _color = Theme.of(context).accentColor;
    if (this.colorable) {
      _color = financeColor(context, this.value);
    }

    if (this.onBuild == null) {
      return Text(displayValue);
    } else {
      return this.onBuild(text: displayValue, value: _value, color: _color);
    }
  }
}

Color financeColor(BuildContext context, dynamic value) {
  var _value = double.tryParse(value.toString()) ?? null;
  var _color = Theme.of(context).accentColor;
  if (_value == null) {
    _color = Colours.gray;
  } else if (value > 0) {
    _color = Colours.red;
  } else if (value < 0) {
    _color = Colours.green;
  } else {
    _color = Colours.gray;
  }
  return _color;
}
