import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    Key key,
    @required this.onTap,
    @required this.child,
  }) : super(key: key);
  final VoidCallback onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: InkWell(
        onTap: this.onTap,
        child: child,
      ),
    );
  }
}
