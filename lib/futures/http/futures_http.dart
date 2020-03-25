import 'dart:async' show Future;
import '../../common/http/http.dart';

import '../models/product_review_model.dart';
import '../models/instrument.dart';
import '../../common/models/page_results.dart';
class FuturesHttp {
  Future<ProductReviewListModel> getProductReviews() async {
    final jsonResponse = await Http.get('/futures/product_reviews/');
    return new ProductReviewListModel.fromJson(jsonResponse);
  }

  static Future<PageResults<Instrument>> fetchFuturesInstruments() async {
    var data = {
      "is_recommended": 1,
      "page_size": 20,
    };
    final jsonResponse = await Http.get('/futures/instruments/', data: data);
    return PageResults<Instrument>.fromJson(jsonResponse, Instrument.fromJson);
  }
}
