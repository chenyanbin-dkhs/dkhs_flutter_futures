import 'package:flutter/material.dart';
import '../models/ads_model.dart';
import '../presenter/ads_presenter.dart';
// import '../../event_bus/my_event_bus.dart';
// import '../../event_bus/page_refresh_event.dart';
import './ads_banner.dart';
import './ads_gridview.dart';

enum AdsWidgetType { BANNER, GRID_VIEW }

class AdsWidget extends StatefulWidget {
  final String areaCode;
  final AdsWidgetType widgetType;
  final bool needUpdate; //是否需要更新
  final double gapWidth;
  AdsWidget(this.areaCode,
      {Key key, this.needUpdate = false, this.widgetType, this.gapWidth})
      : super(key: key);

  _AdsWidgetState createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> implements AdsAreaContract {
  AdsAreaPresenter _presenter;
  List<AdsModel> _ads;

  _AdsWidgetState() {
    _presenter = AdsAreaPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _presenter.setCode(widget.areaCode);
    _presenter.fetchLocal();
    if (widget.needUpdate) {
      // MyEventBus().event.on<PageRefreshEvent>().listen((data) {
      //   _presenter.fetch();
      // });
    } else {
      _presenter.fetch();
    }
  }

  @override
  void onLoadAdsAreaComplete(data) async {
    setState(() {
      _ads = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_ads == null || _ads?.length == 0) {
      return Container();
    }

    if (widget.widgetType == AdsWidgetType.BANNER) {
      return AdsBanner(_ads);
    }
    if (widget.widgetType == AdsWidgetType.GRID_VIEW) {
      return AdsGridView(
        _ads,
        gapWidth: widget.gapWidth,
      );
    }
    return Container();
  }
}
