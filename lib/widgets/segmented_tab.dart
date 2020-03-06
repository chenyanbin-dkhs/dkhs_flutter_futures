import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/resources.dart';
// typedef ValueChanged = void Function(T value);

class SegmentedTab<T> extends StatelessWidget {
  SegmentedTab({this.value, this.children, this.onValueChanged});
  final T value;
  final Map<T, Widget> children;
  final ValueChanged<T> onValueChanged;

  @override
  Widget build(BuildContext context) {
    int length = children.length;
    return Container(
      width: (length * 80.toDouble()),
      height: 30,
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 12,
        ),
        child: CupertinoSegmentedControl<T>(
          children: children,
          groupValue: value,
          selectedColor: Colours.positiveColor,
          borderColor: Colours.positiveColor,
          unselectedColor: Colors.white,
          // pressedColor: Colours.positiveColor,
          onValueChanged: onValueChanged,
        ),
      ),
    );
  }
}
