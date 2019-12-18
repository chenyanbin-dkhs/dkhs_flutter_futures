import 'dart:async';

import 'package:flutter/material.dart';

const DURATION_MILLISECONDS = 1500;
const MAX_VALUE = 10;
const TOTAL_LENGTH = 10;
Duration duration =
      Duration(milliseconds: (DURATION_MILLISECONDS / 2).ceil());
  Curve curve = Curves.easeOut;
class MarqueeVertical extends StatefulWidget {
  MarqueeVertical({Key key}) : super(key: key);

  @override
  _MarqueeVerticalState createState() => _MarqueeVerticalState();
}

class _MarqueeVerticalState extends State<MarqueeVertical> {
  PageController _controller =
      new PageController(initialPage: 0, keepPage: true,viewportFraction: 1.0);
  Timer timer;
  

  @override
  void initState() {
    super.initState();
    startTimer();
    // WidgetsBinding.instance.addPostFrameCallback((callback) {
    //   startTimer();
    // });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: MAX_VALUE,
      scrollDirection: Axis.vertical,
      controller: _controller,
      onPageChanged: (index) {
        var realIndex = (index + 1) % TOTAL_LENGTH;
        print('当前为第 $realIndex 页');
      },
      itemBuilder: (context, index) {
        var realIndex = (index) % TOTAL_LENGTH;
        return new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            '$realIndex',
          ),
        );
      },
      //physics:
    );
  }

  void _animate() {
    if (_controller.page == MAX_VALUE - 1) {
      _controller.animateToPage(0, duration: duration, curve: curve);
    } else {
      _controller.nextPage(duration: duration, curve: curve);
    }
  }

  void startTimer() {
    if (timer == null) {
      timer = Timer.periodic(Duration(milliseconds: DURATION_MILLISECONDS),
          (timer) {
        _animate();
      });
    }
  }
}
