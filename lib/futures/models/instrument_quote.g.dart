// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstrumentQuote _$InstrumentQuoteFromJson(Map<String, dynamic> json) {
  return InstrumentQuote(
    id: json['id'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    price: json['price'] as String,
    vol: json['vol'] as String,
    openv: json['openv'] as String,
    bid1: json['bid1'] as String,
    bidv1: json['bidv1'] as String,
    ask1: json['ask1'] as String,
    askv1: json['askv1'] as String,
    open: json['open'] as String,
    close: json['close'] as String,
    high: json['high'] as String,
    low: json['low'] as String,
    avg: json['avg'] as String,
    upper: json['upper'] as String,
    lower: json['lower'] as String,
    pre: json['pre'] as String,
    delta: json['delta'] as String,
    deltav: json['deltav'] as String,
    settle: json['settle'] as String,
    turnover: json['turnover'] as String,
    preclose: json['preclose'] as String,
    status: json['status'] as String,
    statusInfo: json['status_info'] as String,
  );
}

Map<String, dynamic> _$InstrumentQuoteToJson(InstrumentQuote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'price': instance.price,
      'vol': instance.vol,
      'openv': instance.openv,
      'bid1': instance.bid1,
      'bidv1': instance.bidv1,
      'ask1': instance.ask1,
      'askv1': instance.askv1,
      'open': instance.open,
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'avg': instance.avg,
      'upper': instance.upper,
      'lower': instance.lower,
      'pre': instance.pre,
      'delta': instance.delta,
      'deltav': instance.deltav,
      'settle': instance.settle,
      'turnover': instance.turnover,
      'preclose': instance.preclose,
      'status': instance.status,
      'status_info': instance.statusInfo,
    };
