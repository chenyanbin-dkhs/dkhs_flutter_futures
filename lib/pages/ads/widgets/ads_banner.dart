import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../models/ads_model.dart';
// import '../../widgets/load_image.dart';
// import '../../routers/navigator_utils.dart';

class AdsBanner extends StatelessWidget {
  final List<AdsModel> _ads;
  const AdsBanner(this._ads, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_ads == null || _ads?.length == 0) {
      return Container();
    }

    return Container(
      height: 140, // todo:要按屏幕比设置
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          var item = _ads[index];
          //接口要支持缓存，同时图片也要保存在本地
          // return LoadImage(
          //   _ads[index].image,
          //   fit: BoxFit.fill,
          // );

          return GestureDetector(
            onTap: () {
              // NavigatorUtils.goWebViewPage(
              //     context, item.title, item.redirectUrl);
            },
            // child: LoadImage(
            //   _ads[index].image,
            //   fit: BoxFit.fill,
            // ),
          );
          // return new Image.network(
          //   _ads[index].image,
          //   fit: BoxFit.fill,
          // );
        },
        itemCount: _ads.length,
        pagination: new SwiperPagination(), // todo:UI样式要改
      ),
    );
  }
}
