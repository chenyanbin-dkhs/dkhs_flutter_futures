import 'dart:async' show Future;
import './http.dart';
import '../models/product_review_model.dart';

class FuturesHttp {
  Future<ProductReviewListModel> getProductReviews() async {
    final jsonResponse = await Http.get('/futures/product_reviews/');
    return new ProductReviewListModel.fromJson(jsonResponse);
  }
}
