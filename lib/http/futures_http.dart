import 'dart:async' show Future;
import './http.dart';
import '../models/futures/instrument.dart';
import '../models/page_results.dart';
import '../models/product_review_model.dart';

class FuturesHttp {
  Future<ProductReviewListModel> getProductReviews() async {
    final jsonResponse = await Http.get('/futures/product_reviews/');
    return new ProductReviewListModel.fromJson(jsonResponse);
  }

  static Future<PageResults<Instrument>> fetchFuturesInstruments() async {
    var data = {
      "is_recommended": 1,
      "page_size": 1,
    };
    final jsonResponse = await Http.get('/futures/instruments/', data: data);
    return PageResults<Instrument>.fromJson(jsonResponse, Instrument.fromJson);
  }
}
