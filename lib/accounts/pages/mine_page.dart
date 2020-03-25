import 'package:flutter/material.dart';
import '../../widgets/chart/line_chart/index.dart';
import 'package:intl/intl.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  GlobalKey _scaffold = GlobalKey();
  final PageController _pagecontroller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int tabIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: SingleChildScrollView(
            child: Column(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  transform: Matrix4.translationValues(
                      tabIndex == 1 ? 0 : screenWidth, 0, 0),
                  duration: Duration(milliseconds: 10),
                  curve: Curves.easeIn,
                )
              ],
            ),
            // Container(
            //   height: 1300,
            //   width: double.infinity,
            //   child: PageView(
            //     scrollDirection: Axis.vertical,
            //     physics: NeverScrollableScrollPhysics(),
            //     controller: _pagecontroller,
            //     children: [
            //       new Container(
            //         height: 1200,
            //         color: Colors.yellow,
            //         child: Text('1'),
            //       ),
            //       new Container(
            //         height: 100,
            //         color: Colors.green,
            //         child: Text('2'),
            //       ),
            //     ],
            //   ),
            // )
          ],
        )));
  }
}
