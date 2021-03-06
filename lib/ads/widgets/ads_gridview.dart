import 'package:flutter/material.dart';
import '../models/ads_model.dart';
import '../../widgets/load_image.dart';
import '../../res/resources.dart';
// import '../../routers/navigator_utils.dart';

class AdsGridView extends StatelessWidget {
  final List<AdsModel> _ads;
  final double gapWidth; //左右的边距之和,默认为0
  final int gridSize; // 一行有几个图标,默认为4
  final bool isDarkTheme;
  const AdsGridView(this._ads,
      {Key key, this.gapWidth = 0, this.gridSize = 4, this.isDarkTheme = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_ads == null ||  _ads.isEmpty) {
      return Container();
    }
    double width =
        (MediaQuery.of(context).size.width - gapWidth ?? 0) / gridSize;

    return new Container(
      child: new Wrap(
        alignment: WrapAlignment.center,
        children: _ads.map<Widget>((item) {
          return _buildItem(context, item, width);
        }).toList(),
      ),
    );
  }

  Widget _buildItem(BuildContext context, AdsModel ads, double width) {
    return Container(
        width: width,
        child: new FlatButton(
            onPressed: () {
              //NavigatorUtils.goWebViewPage(context, ads.title, ads.redirectUrl);
            },
            child: new Container(
              padding: EdgeInsets.symmetric(vertical: 7),
              child: new Column(
                children: <Widget>[
                  new LoadImage(
                    ads.image,
                    width: 30,
                    height: 30,
                  ),
                  Gaps.vGap4,
                  new Text(ads.title,
                      softWrap: false,
                      style: new TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal, // todo 要用主题的方式
                          color:
                              isDarkTheme ? Colours.dark_text : Colours.text))
                ],
              ),
            )));
  }
}
