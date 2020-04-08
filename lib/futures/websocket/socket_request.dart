import 'dart:convert';

const reqMarketSnap = 'req_market_snap';
const reqMarketLive = 'req_market_sub'; // 还是比较喜欢 Live这个命名
const reqMarketTimeLine = 'req_market_time_line';

class SocketRequest {
  String action;
  int index;
  String instrumentCode;

  SocketRequest(this.action, this.instrumentCode, {this.index = 0});

  /// 获取合约最新行情，已弃用
  SocketRequest.reqMarketSnap(String instrumentCode)
      : this(reqMarketSnap, instrumentCode);

  /// 
  SocketRequest.reqMarketLive(String instrumentCode)
      : this(reqMarketSnap, instrumentCode);

  SocketRequest.reqMarketTimeLine(String instrumentCode, int _index)
      : this(reqMarketTimeLine, instrumentCode, index: _index);

  String get parameters {
    var obj = {"action": this.action, "payload": {}};
    
    if (this.action == reqMarketSnap) {
      obj["payload"] = {"instrument": this.instrumentCode};
    } else if (this.action == reqMarketTimeLine) {
      obj["payload"] = {
        "index": this.index.toString(),
        "instrument": this.instrumentCode
      };
    }

    return json.encode(obj).toString();
  }
}
