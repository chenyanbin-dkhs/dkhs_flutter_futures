import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';

import './routers/application.dart';
import './routers/routers.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
//  debugProfileBuildsEnabled = true;
//  debugPaintLayerBordersEnabled = true;
//  debugProfilePaintsEnabled = true;

  runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final Widget home;

  MyApp({this.home}) {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return _mainWidgetWithOKToast(
      MaterialApp(
        title: '期货捕猎者',
        //showPerformanceOverlay: true, //显示性能标签
        //debugShowCheckedModeBanner: false,
        //home: SplashPage(),
        onGenerateRoute: Application.router.generator,
        initialRoute: '/',
      ),
    );
  }

  // https://www.kikt.top/posts/flutter/toast/oktoast/
  Widget _mainWidgetWithOKToast(Widget child) {
    return OKToast(
        child: child,
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom);
  }
}
