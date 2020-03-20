import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import './socket_channle.dart';
import './socket_request.dart';
import './socket_response.dart';

import '../models/futures/instrument_time_line.dart';
import '../models/futures/instrument_quote.dart';
import '../utils/number_util.dart';

class SocketMarketTimeLineProvider with ChangeNotifier {
  static IOWebSocketChannel channel;
  Map<String, InstrumentTimeLine> mapInstrumentTimelines = {};
  InstrumentTimeLine timelineByCode(String code) =>
      mapInstrumentTimelines[code];

  Map<String, bool> instrumentPercentageMap = {};

  void setMapInstrumentQuotes(Map<String, InstrumentQuote> value) {
    bool shouldNotify = false;
    value.forEach((k, v) {
      bool newPercentagePositive = v.percentage >= 0;
      bool oldPercentagePositive = instrumentPercentageMap[k];

      if (newPercentagePositive != oldPercentagePositive) {
        instrumentPercentageMap[k] = newPercentagePositive;
        shouldNotify = true;
      }
    });

    if (shouldNotify) {
      print('通过 marketSnap 更新 timeline 涨跌');
      notifyListeners();
    }
  }

  createWebsocket() {
    channel = initializeWebSocketTradeChannel();
    print('建立连接');
    //监听到服务器返回消息
    channel.stream.listen((data) => listenMessage(data),
        onError: onError, onDone: onDone);
  }

  listenMessage(data) {
    if (data == null) {
      return;
    }
    var obj = jsonDecode(data);
    bool shouldNotify = false;
    if (obj is Map) {
      var data =
          InstrumentTimeLine.fromJson(SocketResponse.fromJson(obj).payload);
      if (data != null) {
        String code = data.instrument;
        var newTimeline = data;
        var oldTimeline = mapInstrumentTimelines[code];
        if (oldTimeline == null ||
            oldTimeline.timeLine.length != newTimeline.timeLine.length) {
          mapInstrumentTimelines[code] = data;
          shouldNotify = true;
        }
      }
    }
    if (shouldNotify) {
      notifyListeners();
    }
  }

  requestTimeline(String instrumentCode) {
    if (channel == null) {
      createWebsocket();
    }
    var req = SocketRequest.reqMarketTimeLine(instrumentCode, 0);
    channel.sink.add(req.parameters);
    //print('requestTimeline:' + instrumentCode);
  }

  requestTimelines(List<String> instrumentCodes) {
    for (var code in instrumentCodes) {
      requestTimeline(code);
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
