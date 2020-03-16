import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import './socket_request.dart';
import './socket_response.dart';
import '../models/futures/instrument_quote.dart';

enum SocketConnectStatus { none, error, connected, closed }
typedef Widget ErrorCallback(dynamic error);
typedef Widget SuccessCallback(List<InstrumentQuote> data);
typedef Widget Closedback();

class SocketMarketSnapLoader extends StatefulWidget {
  SocketMarketSnapLoader(
      {Key key,
      @required this.channel,
      @required this.instruments,
      @required this.success,
      @required this.error,
      @required this.closed})
      : super(key: key);
  final IOWebSocketChannel channel;
  final List<String> instruments;
  final Closedback closed;
  final SuccessCallback success;
  final ErrorCallback error;
  @override
  _SocketMarketSnapLoaderState createState() => _SocketMarketSnapLoaderState();
}

class _SocketMarketSnapLoaderState extends State<SocketMarketSnapLoader> {
  SocketConnectStatus _status = SocketConnectStatus.none;
  dynamic _data;
  dynamic _error;
  List<InstrumentQuote> instrumentQuotes = [];
  @override
  void initState() {
    super.initState();
    _sendRequest();
  }

  void _sendRequest() async {
    widget.channel.stream
        .listen((data) => _onSuccess(data), onError: _onError, onDone: _onDone);

    for (var instrument in widget.instruments) {
      var req = SocketRequest.reqMarketSnap(instrument);
      widget.channel.sink.add(req.parameters);
    }
  }

  void _onSuccess(data) {
    if (data == null) {
      return;
    }

    var obj = jsonDecode(data);
    if (obj is Map) {
      var quote =
          InstrumentQuote.fromJson(SocketResponse.fromJson(obj).payload);
      if (quote != null) {
        instrumentQuotes.add(quote);
      }
    }
    if (!mounted) return;

    setState(() {
      _data = instrumentQuotes;
      _status = SocketConnectStatus.connected;
    });
  }

  void _onError(error) {
    if (!mounted) return;
    setState(() {
      _error = error;
      _status = SocketConnectStatus.error;
    });
  }

  void _onDone() {
    if (!mounted) return;
    setState(() {
      _status = SocketConnectStatus.closed;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_status == SocketConnectStatus.none) return SizedBox();
    if (_status == SocketConnectStatus.error) return widget.error(_error);
    if (_status == SocketConnectStatus.closed) return widget.closed();
    return widget.success(_data);
  }
}
