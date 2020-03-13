class SocketResponse {
  String action;
  Map<String, dynamic> payload;

  SocketResponse({this.action, this.payload});

  SocketResponse.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    payload = json['payload'];
  }
}
