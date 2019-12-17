import 'package:flutter/material.dart';
import './load_image.dart';

class MyIconButton extends StatelessWidget {
  final String src;
  const MyIconButton({Key key, @required this.src}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: LoadAssetImage(
        this.src,
        width: 25.0,
        height: 25.0,
      ),
      onPressed: () {},
    );
  }
}
