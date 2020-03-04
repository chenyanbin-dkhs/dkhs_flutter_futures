import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Future<StatusesListModel> fetchCategoryTimeline() async {
    var queryParameters = {
      'is_recommended': 1,
      'category': 'futures_home_headline',
      'page_size': 5
    };

    var uri = Uri.https(
        'www.dkhs.com', '/statuses/category_timeline/', queryParameters);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return StatusesListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
