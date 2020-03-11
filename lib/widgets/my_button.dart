import 'package:flutter/material.dart';

// 规格大小参考 https://ant.design/components/button-cn/
enum ButtonType { def, primary, link }
enum ButtonSize { def, large, small }

class MyButton extends StatelessWidget {
  const MyButton(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.type = ButtonType.def,
      this.size = ButtonSize.def,
      this.isOutline = false})
      : super(key: key);

  final Function onPressed;
  final Widget child;

  final ButtonType type;
  final ButtonSize size;
  final bool isOutline;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      padding: _buildPadding(this.size),
      highlightElevation: 0,
      color: _buildBackgroundColor(context, this.type, this.isOutline),
      textColor: _buildTextColor(context, this.type, this.isOutline),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(const Radius.circular(4)),
          side: BorderSide(
              color: this.isOutline
                  ? _buildTextColor(context, this.type, this.isOutline)
                  : _buildBackgroundColor(context, this.type, this.isOutline))),
      child: this.child,
      onPressed: this.onPressed,
    );
  }

  Color _buildBackgroundColor(
      BuildContext context, ButtonType type, bool isOutline) {
    if (isOutline) {
      return Colors.transparent;
    }
    switch (type) {
      case ButtonType.primary:
        return Theme.of(context).primaryColorDark;
      case ButtonType.link:
        return Colors.transparent;
      default:
        return Theme.of(context).buttonColor;
    }
  }

  Color _buildTextColor(BuildContext context, ButtonType type, bool isOutline) {
    if (isOutline) {
      return Theme.of(context).primaryColorDark;
    }
    switch (type) {
      case ButtonType.primary:
        return Colors.white;
      case ButtonType.link:
        return Theme.of(context).primaryColorDark;
      default:
        return Theme.of(context).accentColor;
    }
  }

  EdgeInsets _buildPadding(ButtonSize size) {
    switch (size) {
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.5);
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 7, vertical: 0);
      default:
        return EdgeInsets.symmetric(horizontal: 15.0, vertical: 4);
    }
  }
}
