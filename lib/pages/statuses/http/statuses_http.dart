import 'dart:async' show Future;
import '../../../http/http.dart';
import '../models/statuses_list_model.dart';

class StatusesHttp {
  Future<StatusesListModel> getGategoryTimeline() async {
    // var data = {'is_recommended': 1, 'category': 'futures_home_headline'};
    final jsonResponse =
        await Http.get('/statuses/category_timeline/?is_recommended=1&category=futures_home_headline');
    
    return new StatusesListModel.fromJson(jsonResponse);
  }
}
