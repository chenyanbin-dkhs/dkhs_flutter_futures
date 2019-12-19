import 'package:flutter/material.dart';
import '../utils/image_utils.dart';

class ImageButton extends StatelessWidget {
  final String src;
  final double width;
  final double height;
  final Function onTap;

  const ImageButton(
      {Key key,
      @required this.src,
      this.width = double.infinity,
      this.height = double.infinity,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      image: ImageUtils.getAssetImage(this.src),
      fit: BoxFit.fill,
      width: this.width,
      height: this.height,
      child: InkWell(
        onTap: () {
          if(this.onTap!=null)
          {
            this.onTap();
          }
        },
      ),
    );
  }
}
