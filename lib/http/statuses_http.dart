import 'dart:async' show Future;
import './http.dart';
import '../models/statuses/statuses_list_model.dart';

class StatusesHttp {
  Future<StatusesListModel> getGategoryTimeline() async {
    var data = {
      'is_recommended': 1,
      'category': 'futures_home_headline',
      'page_size': 5
    };
    final jsonResponse =
        await Http.get('/statuses/category_timeline/', data: data);

    return new StatusesListModel.fromJson(jsonResponse);
  }
}
