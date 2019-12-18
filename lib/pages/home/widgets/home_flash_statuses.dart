import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../res/resources.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/ellipsis_text.dart';

class HomeFlashStatuses extends StatefulWidget {
  HomeFlashStatuses({Key key}) : super(key: key);

  @override
  _HomeFlashStatusesState createState() => _HomeFlashStatusesState();
}

class _HomeFlashStatusesState extends State<HomeFlashStatuses> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.hPadding,
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Row(
              children: <Widget>[
                LoadAssetImage(
                  "home/icon_flash",
                  width: 32,
                  height: 14.5,
                ),
                Gaps.hGap5,
                LoadAssetImage(
                  "home/icon_flash_time",
                  width: 32.5,
                  height: 15,
                ),
                Gaps.hGap10,
              ],
            ),
          ),
          Expanded(
            child: marquee(),
          )
        ],
      ),
    );
  }

  Widget marquee() {
    return CarouselSlider(
      height: 50,
      autoPlay: true,
      scrollDirection: Axis.vertical,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: double.infinity,
                child: EllipsisText(
                  text: '新闻快讯 新闻快讯 新闻快讯 新闻快讯 新闻快讯 新闻快讯 新闻快讯 新闻快讯$i',
                ));
          },
        );
      }).toList(),
    );
  }
}
