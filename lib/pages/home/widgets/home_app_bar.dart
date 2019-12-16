import 'package:flutter/material.dart';

const APPBAR_SCROLL_OFFSET = 100;
const APPBAR_BACKGROUND_COLOR = Color(0xFFf76836);

class HomeAppBar extends StatefulWidget {
  HomeAppBar({Key key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  AnimationController _ColorAnimationController;
  Animation<double> _colorTween;

  @override
  void initState() {
    super.initState();

    _ColorAnimationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween =
        new Tween(begin: 0.0, end: 1.0).animate(_ColorAnimationController);
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollUpdateNotification && scrollInfo.depth == 0) {
      double alpha = scrollInfo.metrics.pixels / APPBAR_SCROLL_OFFSET;
      if (alpha >= 0 && alpha <= 1) {
        _ColorAnimationController.animateTo(alpha);
      }
    }
    return true;
  }

  @override
  void dispose() {
    _ColorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: APPBAR_SCROLL_OFFSET.toDouble(),
      child: AnimatedBuilder(
        animation: _ColorAnimationController,
        builder: (context, child) => AppBar(
          backgroundColor: Color(0xFFf76836).withOpacity(_colorTween.value),
          elevation: 0,
          // titleSpacing: 0.0,
          title: Text(_colorTween.value.toString()),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.local_grocery_store,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
