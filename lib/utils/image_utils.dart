import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageUtils {
  static ImageProvider getAssetImage(String name, {String format: 'png'}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static ImageIcon getIcon(String name, {String format: 'png'}) =>
      ImageIcon(AssetImage(getImgPath(name)));

  static Image getImage(String name, {String format: 'png'}) =>
      new Image.asset(getImgPath(name));

  static Image getBannerImage(String name, {String format: 'png'}) =>
      new Image.asset(
        getImgPath(name, format: format),
        fit: BoxFit.fill,
      );
}
