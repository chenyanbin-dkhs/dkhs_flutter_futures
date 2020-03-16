import 'dart:convert';

class SocketRequest {
  /// req_market_snap
  String action;

  /// IF1909
  String instrumentCode;

  SocketRequest(this.action, this.instrumentCode);

  /// 获取合约最新行情
  SocketRequest.reqMarketSnap(String instrumentCode)
      : this('req_market_snap', instrumentCode);

  String get parameters {
    var obj = {
      "payload": {"instrument": this.instrumentCode},
      "action": this.action
    };
    return json.encode(obj).toString();
  }
}
