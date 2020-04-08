import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  AnimationContainer({Key key}) : super(key: key);

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  final PageController _pagecontroller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            children: [
              RaisedButton(
                onPressed: () {
                  // _pagecontroller.animateToPage(0,
                  //     duration: const Duration(milliseconds: 1),
                  //     curve: Curves.ease);
                  setState(() {
                    tabIndex = 0;
                  });
                },
                child: Text('1'),
              ),
              RaisedButton(
                onPressed: () {
                  // _pagecontroller.animateToPage(1,
                  //     duration: const Duration(milliseconds: 1),
                  //     curve: Curves.ease);
                  setState(() {
                    tabIndex = 1;
                  });
                },
                child: Text('2'),
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            AnimatedContainer(
              child: Container(
                child: Text('1'),
                height: 800,
                color: Colors.red,
              ),
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              transform: Matrix4.translationValues(
                  tabIndex == 0 ? 0 : -screenWidth, 0, 0),
              duration: Duration(milliseconds: 10),
              curve: Curves.easeIn,
            ),
            AnimatedContainer(
              child: Container(
                child: Text('1'),
                height: 200,
                color: Colors.yellow,
              ),
              width: screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              transform: Matrix4.translationValues(
                  tabIndex == 1 ? 0 : screenWidth, 0, 0),
              duration: Duration(milliseconds: 10),
              curve: Curves.easeIn,
            )
          ],
        ),
      ],
    );
  }
}
