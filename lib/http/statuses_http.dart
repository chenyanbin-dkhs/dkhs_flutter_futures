import 'dart:async' show Future;

import './http.dart';
import '../models/statuses/statuses.dart';
import '../models/page_results.dart';

class StatusesHttp {
  Future<PageResults<Statuses>> getGategoryTimeline() async {
    var data = {
      'is_recommended': 1,
      'category': 'futures_home_headline',
      'page_size': 5
    };
    final jsonResponse =
        await Http.get('/statuses/category_timeline/', data: data);

    return PageResults<Statuses>.fromJson(jsonResponse, Statuses.fromJson);
  }
}
