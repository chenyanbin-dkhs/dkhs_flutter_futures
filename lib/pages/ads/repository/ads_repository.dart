import '../models/ads_area_model.dart';
import 'dart:async' show Future;
import '../../../http/http.dart';

class AdsRepository {
  Future<AdsAreaModel> getAdsArea(String areaCode) async {
    final jsonResponse = await Http.get('/ads/area/$areaCode/');
    return new AdsAreaModel.fromJson(jsonResponse);
  }

  Future<AdsAreaListModel> getMultiAdsArea(String areaCodes) async {
    final jsonResponse = await Http.get('/ads/area/?code=$areaCodes');
    return AdsAreaListModel.fromJson(jsonResponse);
  }
}
