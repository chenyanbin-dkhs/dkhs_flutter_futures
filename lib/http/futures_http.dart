import 'dart:async' show Future;
import './http.dart';
import '../models/futures/instrument.dart';
import '../models/page_results.dart';

class FuturesHttp {
  static Future<PageResults<Instrument>> fetchFuturesInstruments() async {
    var data = {
      "is_recommended": 1,
      "page_size": 20,
    };
    final jsonResponse = await Http.get('/futures/instruments/', data: data);
    return PageResults<Instrument>.fromJson(jsonResponse, Instrument.fromJson);
  }
}
