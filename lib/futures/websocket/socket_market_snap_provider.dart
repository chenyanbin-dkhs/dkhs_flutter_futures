import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import './socket_channle.dart';
import './socket_request.dart';
import './socket_response.dart';

import '../models/instrument_quote.dart';

class SocketMarketSnapProvider with ChangeNotifier {
  static IOWebSocketChannel channel;
  static IOWebSocketChannel channelLive;

  /// 保存每个合约的行情
  Map<String, InstrumentQuote> mapInstrumentQuotes = {};

  /// 获取每个合约的行情
  InstrumentQuote quoteByCode(String code) => mapInstrumentQuotes[code];

  createWebSocket() {
    channel = initializeWebSocketTradeChannel();
    channel.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onDone);
  }

  createLiveWebSocket() {
    channelLive = initializeWebSocketQuoteChannel();
    channelLive.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onLiveSocketDone);
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
        mapInstrumentQuotes[newQuote.id] = newQuote;
        //todo 是否要对比一下，跟上次的更新时间
        notifyListeners();
      }
    }
  }

  requestQuotes(List<String> instrumentCodes) {
    if (channel == null) {
      createWebSocket();
    }
    for (var code in instrumentCodes) {
      var req = SocketRequest.reqMarketSnap(code);
      channel.sink.add(req.parameters);
    }

    if (channelLive == null) {
      createLiveWebSocket();
    }
  }

  onError(error) {
    print('error------------>${error}');
  }

  onDone() {}

  onLiveSocketDone() {
    print('onLiveSocket websocket断开了');
    createLiveWebSocket();
  }

  closeWebSocket() {
    //关闭链接
    if (channel != null) {
      channel.sink?.close(status.goingAway);
      channel = null;
    }

    if (channelLive != null) {
      channelLive.sink?.close(status.goingAway);
      channelLive = null;
    }
    //notifyListeners();
  }
}
