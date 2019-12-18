import 'package:flutter/material.dart';
import '../../../utils/image_utils.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/my_icon_button.dart';

// const APPBAR_SCROLL_OFFSET = 100;
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
    AppBar appBar = AppBar(
      backgroundColor: APPBAR_BACKGROUND_COLOR.withOpacity(widget.alpha ?? 0),
      elevation: 0,
      // titleSpacing: 0.0,
      title: LoadAssetImage(
        "app/logo_futures",
        width: 131.5,
        height: 30.5,
      ),
      actions: <Widget>[
        MyIconButton(
          src: 'common/ic_assistant',
        ),
        MyIconButton(
          src: 'common/ic_message',
        ),
      ],
    );
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      //height: appBar.preferredSize.height + 20,
      height: kToolbarHeight + statusBarHeight,
      child: appBar,
    );
  }
}
