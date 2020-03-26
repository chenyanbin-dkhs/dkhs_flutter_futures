import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import './socket_channle.dart';
import './socket_request.dart';
import './socket_response.dart';

import '../models/instrument.dart';
import '../models/instrument_time_line.dart';
import '../models/instrument_quote.dart';

/*
 * 1、请求合约列表，给每个合约生成一个Instrument.TimeLinesMap<TimeString,null> 的值 
 * 2、请求req_market_time_line  ,填充上述这个TimeLinesMap
 * 
 */
class SocketMarketTimeLineProvider with ChangeNotifier {
  static IOWebSocketChannel channel;
  List<Instrument> _listInstrument = [];
  int _receivedLength = 0;
  Instrument getInstrument(String code) => _listInstrument
      .firstWhere((item) => item.code == code, orElse: () => null);

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
      //print('通过 marketSnap 更新 timeline 涨跌');
      //notifyListeners();
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
      var marketTimeLine =
          InstrumentTimeLine.fromJson(SocketResponse.fromJson(obj).payload);

      if (marketTimeLine != null) {
        updateInstrumentTimeLine(
            marketTimeLine.instrument, marketTimeLine.timeLine);
      }
    }
    _receivedLength++;
    if (_receivedLength >= _listInstrument.length) {
      print(_receivedLength);
      notifyListeners();
    }
  }

  void updateInstrumentTimeLine(String code, List<TimeLine> newTimeLines) {
    var instrument = _listInstrument.firstWhere((item) => item.code == code,
        orElse: () => null);
    if (instrument != null) {
      var oldTimeLineMap = instrument.timeLineMap;
      var newTimeLineMap = {
        for (var item in newTimeLines) item.time.substring(0, 5): item
      };
      oldTimeLineMap.addAll(newTimeLineMap);
    }
  }

  requestTimeline(String instrumentCode) {
    var req = SocketRequest.reqMarketTimeLine(instrumentCode, 0);
    channel.sink.add(req.parameters);
  }

  requestTimelines(List<Instrument> list) {
    if (channel == null) {
      createWebsocket();
    }
    _receivedLength = 0; // reset
    this._listInstrument = list;
    for (var item in list) {
      requestTimeline(item.code);
    }
  }

  onError(error) {
    print('error------------>${error}');
  }

  void onDone() {
    print('SocketMarketTimeLineProvider websocket断开了');
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
