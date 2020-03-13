import 'package:web_socket_channel/io.dart';

const tradeUrl = 'wss://ws.dkhs.com/futures/trade';
const quoteUrl = 'wss://ws.dkhs.com/futures/quote';

enum SocketChannleType { trade, quote }

// class SocketChannle {
//   SocketChannleType type;
//   static IOWebSocketChannel _channel;

//   // factory SocketChannleType(SocketChannleType type) {
//   //   final url = type == SocketChannleType.trade ? tradeUrl : quoteUrl;
//   //   if (_channel == null) {
//   //     _channel = IOWebSocketChannel.connect(url);
//   //   }
//   // }
//   // SocketChannleType._internal(this.type);

//   // IOWebSocketChannel connect() {
//   //   final url = this.type == SocketChannleType.trade ? tradeUrl : quoteUrl;
//   //   IOWebSocketChannel.connect(url);
//   // }
// }

IOWebSocketChannel _initializeWebSocketChannel(String url) {
  return IOWebSocketChannel.connect(url);
}

IOWebSocketChannel initializeWebSocketTradeChannel() {
  return _initializeWebSocketChannel(tradeUrl);
}

IOWebSocketChannel initializeWebSocketQuoteChannel() {
  return _initializeWebSocketChannel(quoteUrl);
}
