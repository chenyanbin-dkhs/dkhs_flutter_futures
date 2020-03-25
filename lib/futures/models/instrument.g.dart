// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instrument _$InstrumentFromJson(Map<String, dynamic> json) {
  return Instrument()
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..instrumentName = json['instrument_name'] as String
    ..productCode = json['product_code'] as String
    ..productId = json['product_id'] as String
    ..isHot = json['is_hot'] as bool
    ..isRecommended = json['is_recommended'] as bool
    ..pricePerPoint = (json['price_per_point'] as num)?.toDouble()
    ..figuresPrice = (json['figures_price'] as num)?.toDouble()
    ..priceFormat = json['price_format'] as String
    ..allowAnyPrice = json['allow_any_price'] as int
    ..maxTradeAmount = json['max_trade_amount'] as int
    ..takeProfitMin = json['take_profit_min'] as String
    ..takeProfitMax = json['take_profit_max'] as String
    ..takeProfitStep = json['take_profit_step'] as String
    ..takeProfitDefault = json['take_profit_default'] as String
    ..stopLossMin = json['stop_loss_min'] as String
    ..stopLossMax = json['stop_loss_max'] as String
    ..stopLossStep = json['stop_loss_step'] as String
    ..stopLossDefault = json['stop_loss_default'] as String
    ..lightningPoints = json['lightning_points'] as int
    ..minValueRange = (json['min_value_range'] as num)?.toDouble()
    ..minRealtimeValueRange =
        (json['min_realtime_value_range'] as num)?.toDouble()
    ..icon = json['icon'] as String
    ..exchange = json['exchange'] as String
    ..exchangeInst = json['exchange_inst'] as String
    ..exchangeAbbr = json['exchange_abbr'] as String
    ..isMajor = json['is_major'] as bool
    ..timeRanges = (json['time_ranges'] as List)
        ?.map((e) => e == null
            ? null
            : InstrumentTimeRanges.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$InstrumentToJson(Instrument instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'instrument_name': instance.instrumentName,
      'product_code': instance.productCode,
      'product_id': instance.productId,
      'is_hot': instance.isHot,
      'is_recommended': instance.isRecommended,
      'price_per_point': instance.pricePerPoint,
      'figures_price': instance.figuresPrice,
      'price_format': instance.priceFormat,
      'allow_any_price': instance.allowAnyPrice,
      'max_trade_amount': instance.maxTradeAmount,
      'take_profit_min': instance.takeProfitMin,
      'take_profit_max': instance.takeProfitMax,
      'take_profit_step': instance.takeProfitStep,
      'take_profit_default': instance.takeProfitDefault,
      'stop_loss_min': instance.stopLossMin,
      'stop_loss_max': instance.stopLossMax,
      'stop_loss_step': instance.stopLossStep,
      'stop_loss_default': instance.stopLossDefault,
      'lightning_points': instance.lightningPoints,
      'min_value_range': instance.minValueRange,
      'min_realtime_value_range': instance.minRealtimeValueRange,
      'icon': instance.icon,
      'exchange': instance.exchange,
      'exchange_inst': instance.exchangeInst,
      'exchange_abbr': instance.exchangeAbbr,
      'is_major': instance.isMajor,
      'time_ranges': instance.timeRanges?.map((e) => e?.toJson())?.toList(),
    };
