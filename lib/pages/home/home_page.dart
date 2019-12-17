import 'package:flutter/material.dart';
import './widgets/main_banner.dart';
import './widgets/home_app_bar.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double alpha;
  @override
  void initState() {
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollUpdateNotification && scrollInfo.depth == 0) {
      double _alpha = scrollInfo.metrics.pixels / APPBAR_SCROLL_OFFSET;
      if (_alpha < 0) {
        _alpha = 0;
      } else if (_alpha > 1) {
        _alpha = 1;
      }

      if (_alpha != this.alpha) {
        setState(() {
          alpha = _alpha;
        });
      }
    }
    return true;
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
                        child: Text(this.alpha.toString()),
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
              HomeAppBar(
                alpha: this.alpha,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
