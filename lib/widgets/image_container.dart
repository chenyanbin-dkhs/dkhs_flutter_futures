import 'package:flutter/material.dart';
import '../utils/image_utils.dart';

class ImageContainer extends StatelessWidget {
  final String src;
  final Widget child;
  final double height;
  const ImageContainer(
      {Key key, @required this.src, this.child, this.height = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
        height: this.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageUtils.getAssetImage(this.src),
            fit: BoxFit.contain,
          ),
        ),
        child: this.child);
  }
}
