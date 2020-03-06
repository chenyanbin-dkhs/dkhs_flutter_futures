import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../models/ads/ads_model.dart';
import '../../../widgets/load_image.dart';

const double swiperHeight = 140;

class AdsBanner extends StatelessWidget {
  final List<AdsModel> _ads;
  const AdsBanner(this._ads, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_ads == null || _ads.isEmpty) {
      return Container();
    }
    // todo 这个Swiper控件也是奇怪，当只有一张图时，也能无限滚动~~~
    if (_ads.length == 1) {
      return Container(
        height: swiperHeight,
        width: double.infinity,
        child: _buildGestureDetector(_ads[0]),
      );
    }
    return Container(
      height: swiperHeight,
      child: new Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          var item = _ads[index];
          return _buildGestureDetector(item);
        },
        itemCount: _ads.length,
        pagination: new SwiperPagination(), // todo:UI样式要改
      ),
    );
  }

  Widget _buildGestureDetector(AdsModel item) {
    return GestureDetector(
      onTap: () {
        // NavigatorUtils.goWebViewPage(
        //     context, item.title, item.redirectUrl);
      },
      child: LoadImage(
        item.image,
        fit: BoxFit.fill,
      ),
    );
  }
}
