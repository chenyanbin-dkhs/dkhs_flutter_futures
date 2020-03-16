import 'dart:convert';

import 'package:flutter/material.dart';
import '../../models/futures/instrument_quote.dart';
import 'package:web_socket_channel/io.dart';
import '../../websocket/index.dart';

class StatusesPage extends StatefulWidget {
  StatusesPage({Key key}) : super(key: key);

  @override
  _StatusesPageState createState() => _StatusesPageState();
}

class _StatusesPageState extends State<StatusesPage> {
  IOWebSocketChannel channel;
  var aMapOfIntToDouble = <String, InstrumentQuote>{};

  @override
  void initState() {
    super.initState();
    //listenWs();
    createWebsocket();
  }

  createWebsocket() async {
    //创建连接并且发送鉴别身份信息
    channel = initializeWebSocketTradeChannel();
    // print('websocket连接了');
    // Future.delayed(Duration(milliseconds: 1000)).then((_) {
    //   var req = SocketRequest.reqMarketSnap('IF1909');
    //   var req2 = SocketRequest.reqMarketSnap('IF2003');

    //   channel.sink.add(req.parameters);
    //   channel.sink.add(req2.parameters);
    // });

    // channel.stream.listen((data) => listenMessage(data),
    //     onError: onError, onDone: onDone);

    // Future.delayed(Duration(milliseconds: 2000)).then((_) {
    //   var obj = {
    //     "aid": "ba39d271-cf28-40ad-ab3b-36e336a734f8",
    //     "payload": {"index": 185, "instrument": "IF2003"},
    //     "action": "req_market_time_line"
    //   };

    //   String text = json.encode(obj).toString();
    //   channel.sink.add(text);
    // });
  }

  listenMessage(data) {
    var obj = jsonDecode(data);
    if (obj is Map) {
      print(obj['payload']['id']);
    }
  }

  onError(error) {
    print('websocket错误了');
  }

  void onDone() {
    print('websocket断开了');
    if (mounted) {
      print('websocket重连');

      createWebsocket();
    }
  }

  closeWebSocket() {
    //关闭链接
    channel.sink?.close();
    print('关闭了websocket');
  }

  @override
  void dispose() {
    closeWebSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('话题'),
        ),
        body: Center(
          child: SocketMarketSnapLoader(
            channel: channel,
            instruments: ['IF1909', 'IF2003'],
            success: (data) => Center(child: Text(data.length.toString())),
            error: (err) => Center(child: Text('err')),
            closed: () => Center(child: Text('closed')),
          ),
        ));
    // body: Center(
    //   child: StreamBuilder(
    //     stream: channel.stream,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         print(snapshot.data);
    //       }
    //       return Text('builder');
    //     },
    //   ),
    // ));
  }
}
