import 'dart:convert';

class SocketRequest {
  String action, instrument;

  SocketRequest(this.action, this.instrument);

  /// 获取合约最新行情
  SocketRequest.reqMarketSnap(String instrument)
      : this('req_market_snap', instrument);

  String get parameters {
    var obj = {
      "payload": {"instrument": this.instrument},
      "action": this.action
    };
    return json.encode(obj).toString();
  }
}
