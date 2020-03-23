import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import './socket_channle.dart';
import './socket_request.dart';
import './socket_response.dart';

import '../models/futures/instrument_quote.dart';

class SocketMarketSnapProvider with ChangeNotifier {
  static IOWebSocketChannel channel;

  /// 保存每个合约的行情
  Map<String, InstrumentQuote> mapInstrumentQuotes = {};

  /// 获取每个合约的行情
  InstrumentQuote quoteByCode(String code) => mapInstrumentQuotes[code];

  createWebsocket() {
    channel = initializeWebSocketTradeChannel();
    print('建立连接' + DateTime.now().toString());
    //监听到服务器返回消息
    channel.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onDone);
  }

  listenMessage(data) {
    if (data == null) {
      return;
    }
    var obj = jsonDecode(data);

    if (obj is Map) {
      var newQuote =
          InstrumentQuote.fromJson(SocketResponse.fromJson(obj).payload);
      if (newQuote != null) {
        var olderQuote = mapInstrumentQuotes[newQuote.id];
        // 对比下新推送过来的行情，如果有变化，再发出通知。
        if (olderQuote == null ||
            olderQuote.time != newQuote.time ||
            olderQuote.price != newQuote.price) {
          mapInstrumentQuotes[newQuote.id] = newQuote;

          notifyListeners();

          print('marketSnap notifyListeners:' + newQuote.id);
        }
      }
    }
  }

  /// 请求历史行情 
  requestQuotes(List<String> instrumentCodes) {
    if (channel == null) {
      createWebsocket();
    }
    print('requestQuotes');
    for (var code in instrumentCodes) {
      var req = SocketRequest.reqMarketSnap(code);
      channel.sink.add(req.parameters);
    }
  }

  onError(error) {
    print('error------------>${error}');
  }

  void onDone() {
    print('websocket断开了');
    // createWebsocket();
    // print('websocket重连');
  }

  closeWebSocket() {
    //关闭链接
    if (channel != null) {
      channel.sink?.close(status.goingAway);
      channel = null;
    }
    //notifyListeners();
  }
}
