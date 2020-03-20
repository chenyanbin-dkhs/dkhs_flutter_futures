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
  Map<String, InstrumentQuote> mapInstrumentQuotes = {};
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
        // 多一层判断可以优化性能
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

  requestQuote(String instrumentCode) {
    if (channel == null) {
      createWebsocket();
    }
    var req = SocketRequest.reqMarketSnap(instrumentCode);
    channel.sink.add(req.parameters);
    //print('requestQuote');
  }

  requestQuotes(List<String> instrumentCodes) {
    print('requestQuotes');
    for (var code in instrumentCodes) {
      requestQuote(code);
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

// class SocketMarketSnapPercentageProvider with ChangeNotifier {
//   Map<String, bool> instrumentPercentageMap = {};
//   bool isPercentagePositve(String instrumentCode) =>
//       instrumentPercentageMap[instrumentCode];

//   void setInstrumentPercentage(String instrumentCode, double value) {
//     bool oldValue = instrumentPercentageMap[instrumentCode];
//     bool newValue = value >= 0;
//     if (oldValue != newValue) {
//       instrumentPercentageMap[instrumentCode] = newValue;
//       notifyListeners();
//     }
//   }
// }
