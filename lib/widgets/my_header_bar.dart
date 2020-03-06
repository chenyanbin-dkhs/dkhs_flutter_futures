import 'package:flutter/material.dart';

class MyHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const MyHeaderBar({
    Key key,
    this.title: "",
    this.actions,
    this.titleWidget,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final Widget titleWidget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: titleWidget == null ? Text(title) : titleWidget,
      centerTitle: titleWidget == null,
      actions: actions != null && actions.length > 0 ? actions : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kMinInteractiveDimension);
}
