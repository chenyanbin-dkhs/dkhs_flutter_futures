import 'dart:convert';

const reqMarketSnap = 'req_market_snap';
const reqMarketTimeLine = 'req_market_time_line';

class SocketRequest {
  String action;
  int index;
  String instrumentCode;

  SocketRequest(this.action, this.instrumentCode, {this.index = 0});

  /// 获取合约最新行情
  SocketRequest.reqMarketSnap(String instrumentCode)
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
