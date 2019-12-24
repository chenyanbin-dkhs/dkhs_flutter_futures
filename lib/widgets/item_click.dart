import 'package:flutter/material.dart';

class ItemClick extends StatelessWidget {
  final Widget child;
  final Function onTap;

  const ItemClick({Key key, @required this.child, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Material(
        child: new InkWell(onTap: onTap, child: child),
        color: Colors.transparent,
      ),
    );
  }
}
