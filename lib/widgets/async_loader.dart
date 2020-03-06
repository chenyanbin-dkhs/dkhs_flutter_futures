import 'dart:async';
import 'package:flutter/material.dart';

// 参考 https://github.com/chimon2000/async_loader/blob/master/lib/async_loader.dart
typedef Widget LoadingCallback();
typedef Widget ErrorCallback([dynamic error]);
typedef Widget SuccessCallback({dynamic data});
typedef Future<Object> InitStateCallback();

enum AsyncStatus { Error, Loading, Success }

class AsyncLoader extends StatefulWidget {
  AsyncLoader(
      {Key key,
      this.loading,
      this.success,
      this.error,
      this.initState})
      : super(key: key);

  final LoadingCallback loading;
  final SuccessCallback success;
  final ErrorCallback error;
  final InitStateCallback initState;

  @override
  _AsyncLoaderState createState() => _AsyncLoaderState();
}

class _AsyncLoaderState extends State<AsyncLoader> {
  var _asyncStatus = AsyncStatus.Loading;
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
      _asyncStatus = AsyncStatus.Loading;
    });

    try {
      var data = await widget.initState();

      if (!mounted) return;

      setState(() {
        _data = data;
        _asyncStatus = AsyncStatus.Success;
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = e;
        _data = null;
        _asyncStatus = AsyncStatus.Error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_asyncStatus == AsyncStatus.Loading) return widget.loading();
    if (_asyncStatus == AsyncStatus.Error) return widget.error(_error);

    return widget.success(data: _data);
  }
}
