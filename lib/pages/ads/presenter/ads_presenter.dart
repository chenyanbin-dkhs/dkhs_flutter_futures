import '../models/ads_model.dart';
import '../http/ads_http.dart';

// 尝试用MVP模式https://github.com/fabiomsr/Flutter-StepByStep/tree/master/step3/lib
abstract class AdsAreaContract {
  void onLoadAdsAreaComplete(List<AdsModel> items);
}

class AdsAreaPresenter {
  AdsAreaContract _contract;
  String _areaCode;
  String get _cacheKey => 'ads_' + _areaCode;
  AdsAreaPresenter(this._contract);

  ///这个得提前调用
  void setCode(String areaCode) {
    _areaCode = areaCode;
  }

  void fetch() async {
    assert(_contract != null);
    assert(_areaCode.isNotEmpty, 'areaCode 未初始化');

    var data = await AdsHttp().getAdsArea(_areaCode);
    _contract.onLoadAdsAreaComplete(data?.ads ?? []);

    //CacheApiUtils.cacheModelList<AdsModel>(_cacheKey, list: data?.ads);
  }

  void fetchLocal() async {
    assert(_contract != null);
    assert(_areaCode.isNotEmpty, 'areaCode 未初始化');
    //List<AdsModel> _adsLocal = CacheApiUtils.cacheModelList<AdsModel>(_cacheKey);
    //_contract.onLoadAdsAreaComplete(_adsLocal);
  }
}
