import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './router_init.dart';
import '../navigator/futures_navigator.dart';
import './404.dart';

class Routers {
  /// 这边设置了首页，固定写法 /，否则会多创建出一个history出来
  static String homeNavigator = "/";

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("未找到目标页");
      return WidgetNotFound();
    });

    router.define(homeNavigator,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    HomeNavigator()));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
