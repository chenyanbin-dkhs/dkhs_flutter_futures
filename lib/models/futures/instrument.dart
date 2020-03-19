import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

import './instrument_time_ranges.dart';
import './instrument_time_line.dart';
part 'instrument.g.dart';

@JsonSerializable(explicitToJson: true)
class Instrument {
  String code;
  String name;

  @JsonKey(name: 'instrument_name')
  String instrumentName;

  @JsonKey(name: 'product_code')
  String productCode;

  @JsonKey(name: 'product_id')
  String productId;

  @JsonKey(name: 'is_hot')
  bool isHot;

  @JsonKey(name: 'is_recommended')
  bool isRecommended;

  @JsonKey(name: 'price_per_point')
  double pricePerPoint;

  @JsonKey(name: 'figures_price')
  double figuresPrice;

  @JsonKey(name: 'price_format')
  String priceFormat;

  @JsonKey(name: 'allow_any_price')
  int allowAnyPrice;

  @JsonKey(name: 'max_trade_amount')
  int maxTradeAmount;

  @JsonKey(name: 'take_profit_min')
  String takeProfitMin;

  @JsonKey(name: 'take_profit_max')
  String takeProfitMax;

  @JsonKey(name: 'take_profit_step')
  String takeProfitStep;

  @JsonKey(name: 'take_profit_default')
  String takeProfitDefault;

  @JsonKey(name: 'stop_loss_min')
  String stopLossMin;

  @JsonKey(name: 'stop_loss_max')
  String stopLossMax;

  @JsonKey(name: 'stop_loss_step')
  String stopLossStep;

  @JsonKey(name: 'stop_loss_default')
  String stopLossDefault;

  @JsonKey(name: 'lightning_points')
  int lightningPoints;

  @JsonKey(name: 'min_value_range')
  double minValueRange;

  @JsonKey(name: 'min_realtime_value_range')
  double minRealtimeValueRange;

  String icon;
  String exchange;

  @JsonKey(name: 'exchange_inst')
  String exchangeInst;

  @JsonKey(name: 'exchange_abbr')
  String exchangeAbbr;

  @JsonKey(name: 'is_major')
  bool isMajor;

  @JsonKey(name: 'time_ranges')
  List<InstrumentTimeRanges> timeRanges;
  Map<String, TimeLine> _timeRangesMap;

  Map<String, TimeLine> get timeRangesMap {
    if (_timeRangesMap == null) {
      _timeRangesMap = {};
      for (var item in this.timeRanges) {
        _timeRangesMap.addAll(generateTimeMap(item.start, item.end));
      }
    }

    return this._timeRangesMap;
  }

  /// 是否有夜盘
  bool get isTradingNight {
    return this.timeRanges.length >= 3;
  }

  Instrument();

  // factory Instrument.fromJson(Map<String, dynamic> json) =>
  //     _$InstrumentFromJson(json);

  static Instrument fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
  Map<String, dynamic> toJson() => _$InstrumentToJson(this);
}

Map<String, TimeLine> generateTimeMap(fromStr, toStr) {
  DateFormat formatter = new DateFormat("HH:mm");
  DateTime from = formatter.parse(fromStr);
  DateTime to = formatter.parse(toStr);

  Duration difference = to.difference(from);
  int deffMinutes = difference.inMinutes;
  Map<String, TimeLine> timeMap = {};
  for (var i = 0; i <= deffMinutes; i++) {
    timeMap[formatter.format(from.add(Duration(minutes: i)))] = null;
  }
  return timeMap;
}
