import 'package:flutter/material.dart';
import '../../widgets/marquee_vertical.dart';
import './widgets/main_banner.dart';
import './widgets/home_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                    // Container(
                    //   height: 50,
                    //   color: Colors.blue,
                    //   child: MarqueeVertical(),
                    // ),
                    CarouselSlider(
                      height: 50.0,
                      autoPlay: true,
                      scrollDirection: Axis.vertical,
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(color: Colors.amber),
                                child: Text(
                                  'text $i',
                                  style: TextStyle(fontSize: 16.0),
                                ));
                          },
                        );
                      }).toList(),
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
