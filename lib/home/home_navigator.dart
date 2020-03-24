import 'package:flutter/material.dart';
import '../utils/image_utils.dart';

import './models/navigator_model.dart';
import '../res/resources.dart';
import '../widgets/load_image.dart';

import './home_page.dart';
import '../pages/futures/instruments_page.dart';
import '../pages/statuses/statuses_page.dart';
import '../pages/mine/mine_page.dart';

class HomeNavigator extends StatefulWidget {
  HomeNavigator({Key key}) : super(key: key);

  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentIndex = 0;
  List<Widget> _pageList;
  final PageController _pagecontroller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  List<NavigatorModel> _list = [
    NavigatorModel(icon: 'app/tab_home', title: '首页'),
    NavigatorModel(icon: 'app/tab_trades', title: '交易'),
    NavigatorModel(icon: 'app/tab_statuses', title: '资讯'),
    NavigatorModel(icon: 'app/tab_mine', title: '我的')
  ];

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
      body: PageView(
        controller: _pagecontroller,
        physics: NeverScrollableScrollPhysics(), //禁止左右滑动
        children: _pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _createBottomItems(),
        currentIndex: _currentIndex,
        elevation: 5.0,
        selectedFontSize: Dimens.font_sp10,
        unselectedFontSize: Dimens.font_sp10,
        selectedItemColor: Colors.red[600],
        onTap: (index) {
          _pagecontroller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void initData() {
    _pageList = [
      HomePage(),
      InstrumentsPage(),
      StatusesPage(),
      MinePage(),
    ];
  }

  // 创建底部导航item
  List<BottomNavigationBarItem> _createBottomItems() {
    return List.generate(_list.length, (i) {
      NavigatorModel item = _list[i];
      return BottomNavigationBarItem(
        icon: LoadAssetImage(item.icon, width: 25.0),
        activeIcon: LoadAssetImage(item.activeIcon, width: 25.0),
        title: Text(item.title),
      );
    });
  }
}
