import 'package:json_annotation/json_annotation.dart';
part 'instrument_quote.g.dart';

@JsonSerializable()
class InstrumentQuote {
  String id;
  String date;
  String time;
  String price;
  String vol;
  String openv;
  String bid1;
  String bidv1;
  String ask1;
  String askv1;
  String open;
  String close;
  String high;
  String low;
  String avg;
  String upper;
  String lower;
  String pre;
  String delta;
  String deltav;
  String settle;
  String turnover;
  String preclose;

  InstrumentQuote(
      {this.id,
      this.date,
      this.time,
      this.price,
      this.vol,
      this.openv,
      this.bid1,
      this.bidv1,
      this.ask1,
      this.askv1,
      this.open,
      this.close,
      this.high,
      this.low,
      this.avg,
      this.upper,
      this.lower,
      this.pre,
      this.delta,
      this.deltav,
      this.settle,
      this.turnover,
      this.preclose});

  factory InstrumentQuote.fromJson(Map<String, dynamic> json) =>
      _$InstrumentQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$InstrumentQuoteToJson(this);
}
