import 'package:flutter/material.dart';

const APPBAR_SCROLL_OFFSET = 100;
const APPBAR_BACKGROUND_COLOR = Color(0xFFf76836);

class HomeAppBar extends StatefulWidget {
  final double alpha;
  HomeAppBar({Key key, this.alpha = 0}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  // AnimationController animationController;
  // Animation<double> _colorTween;

  @override
  void initState() {
    super.initState();

    // animationController =
    //     new AnimationController(vsync: this, duration: Duration(seconds: 0));
    // _colorTween = new Tween(begin: 0.0, end: 1.0).animate(animationController);
  }

  // bool _scrollListener(ScrollNotification scrollInfo) {
  //   if (scrollInfo is ScrollUpdateNotification && scrollInfo.depth == 0) {
  //     double alpha = scrollInfo.metrics.pixels / APPBAR_SCROLL_OFFSET;
  //     if (alpha >= 0 && alpha <= 1) {
  //       animationController.animateTo(alpha);
  //     }
  //   }
  //   return true;
  // }

  @override
  void dispose() {
    //animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: APPBAR_SCROLL_OFFSET.toDouble(),
      child: AppBar(
        backgroundColor: APPBAR_BACKGROUND_COLOR.withOpacity(widget.alpha ?? 0),
        elevation: 0,
        // titleSpacing: 0.0,
        title: Text(widget.alpha.toString()),
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
    );
  }
}
