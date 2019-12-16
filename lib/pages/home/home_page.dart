import 'package:flutter/material.dart';
import './widgets/main_banner.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MainBanner(),
                    Container(
                      height: 150,
                      color: Colors.blue,
                      width: 250,
                    ),
                    Container(
                      height: 150,
                      color: Colors.pink,
                      width: 250,
                    ),
                    Container(
                      height: 150,
                      color: Colors.deepOrange,
                      width: 250,
                      child: Center(
                        child: Text(_colorTween.value.toString()),
                      ),
                    ),
                    Container(
                      height: 150,
                      color: Colors.red,
                      width: 250,
                    ),
                    Container(
                      height: 150,
                      color: Colors.white70,
                      width: 250,
                    ),
                    Container(
                      height: 150,
                      color: Colors.yellow,
                      width: 250,
                    ),
                    Container(
                      height: 150,
                      color: Colors.green,
                      width: 250,
                    ),
                  ],
                ),
              ),
              Container(
                height: APPBAR_SCROLL_OFFSET.toDouble(),
                child: AnimatedBuilder(
                  animation: _ColorAnimationController,
                  builder: (context, child) => AppBar(
                    backgroundColor:
                        Color(0xFFf76836).withOpacity(_colorTween.value),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
