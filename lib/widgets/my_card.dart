import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final Widget child;
  final Color color;
  MyCard({Key key, @required this.child, this.color = Colors.transparent})
      : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.all(const Radius.circular(4)),
      ),
      child: widget.child,
    );
  }
}
