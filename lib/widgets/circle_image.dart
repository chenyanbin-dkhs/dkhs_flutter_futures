import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  CircleImage(this.imageUrl, this.width);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width,
      height: width,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(imageUrl ?? ''),
        ),
      ),
    );
  }
}
