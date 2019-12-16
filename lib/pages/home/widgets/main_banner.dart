import 'package:flutter/material.dart';
import '../../../utils/image_utils.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageUtils.getImage("home/bg_main_banner"),
    );
  }
}
