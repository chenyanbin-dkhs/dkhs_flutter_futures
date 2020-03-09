import 'dart:async';
import 'package:flutter/material.dart';

// 参考 https://github.com/chimon2000/async_loader/blob/master/lib/async_loader.dart
typedef Widget LoadingCallback();
typedef Widget ErrorCallback([dynamic error]);
typedef Widget SuccessCallback({dynamic data});
typedef Future<Object> InitStateCallback();

enum AsyncStatus { error, loading, success }

class AsyncLoader extends StatefulWidget {
  AsyncLoader({Key key, this.loading, this.success, this.error, this.init})
      : super(key: key);

  final LoadingCallback loading;
  final SuccessCallback success;
  final ErrorCallback error;
  final InitStateCallback init;

  // @override
  // _AsyncLoaderState createState() => _AsyncLoaderState();

  @override
  State<StatefulWidget> createState() => new AsyncLoaderState();
}

class AsyncLoaderState extends State<AsyncLoader> {
  var _asyncStatus = AsyncStatus.loading;
  dynamic _data;
  dynamic _error;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  Future<void> reloadState() {
    return _initState();
  }

  Future<void> _initState() async {
    if (!mounted) return;

    setState(() {
      _asyncStatus = AsyncStatus.loading;
    });

    try {
      var data = await widget.init();

      if (!mounted) return;

      setState(() {
        _data = data;
        _asyncStatus = AsyncStatus.success;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = e;
        _data = null;
        _asyncStatus = AsyncStatus.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_asyncStatus == AsyncStatus.loading) return widget.loading();
    if (_asyncStatus == AsyncStatus.error) return widget.error(_error);

    return widget.success(data: _data);
  }
}
