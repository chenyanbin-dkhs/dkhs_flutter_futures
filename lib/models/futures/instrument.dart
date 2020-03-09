import 'package:json_annotation/json_annotation.dart';
import './instrument_time_ranges.dart';
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
  String isMajor;

  @JsonKey(name: 'time_ranges')
  List<InstrumentTimeRanges> timeRanges;

  Instrument(
      {this.code,
      this.name,
      this.instrumentName,
      this.productCode,
      this.productId,
      this.isHot,
      this.isRecommended,
      this.pricePerPoint,
      this.figuresPrice,
      this.priceFormat,
      this.allowAnyPrice,
      this.maxTradeAmount,
      this.takeProfitMin,
      this.takeProfitMax,
      this.takeProfitStep,
      this.takeProfitDefault,
      this.stopLossMin,
      this.stopLossMax,
      this.stopLossStep,
      this.stopLossDefault,
      this.lightningPoints,
      this.minValueRange,
      this.minRealtimeValueRange,
      this.timeRanges,
      this.icon,
      this.exchange,
      this.exchangeInst,
      this.exchangeAbbr,
      this.isMajor});

  // factory Instrument.fromJson(Map<String, dynamic> json) =>
  //     _$InstrumentFromJson(json);

  static Instrument fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
  Map<String, dynamic> toJson() => _$InstrumentToJson(this);
}
