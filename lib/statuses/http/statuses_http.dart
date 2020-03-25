import 'dart:async' show Future;

import '../../common/http/http.dart';
import '../models/statuses.dart';
import '../../common/models/page_results.dart';

/*
 使用方法：
 ```
  Future<PageResults<Statuses>> statuses;
  statuses = StatusesHttp().getGategoryTimeline(); // initState
  FutureBuilder<PageResults<Statuses>>(
            future: statuses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildList(snapshot.data.results);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            })
```
 * 
*/
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
