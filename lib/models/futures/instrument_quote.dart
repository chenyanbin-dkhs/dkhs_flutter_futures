import 'package:json_annotation/json_annotation.dart';
part 'instrument_quote.g.dart';

@JsonSerializable()
class InstrumentQuote {
  /// instrument code
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

  double get percentage {
    var _pre = double.tryParse(this.pre) ?? null;
    if (_pre > 0) {
      var _delta = double.tryParse(this.delta) ?? null;
      var _price = double.tryParse(this.price) ?? null;

      if (_delta != null) {
        return _delta / _pre * 100;
      } else if (_price != null) {
        return (_price - _pre) / _pre * 100;
      }
    }
    return _pre;
  }

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

//       - (NSString *)percentage {
//     CGFloat pre = self.pre.floatValue;
//     if (pre > 0 && (self.delta || self.price)) {
//         if (self.delta) {
//             return NUMBER_TO_PERCENT_STRING(@((self.delta.floatValue) / pre * 100));
//         } else {
//             return NUMBER_TO_PERCENT_STRING(@((self.price.floatValue - pre) / pre * 100));
//         }
//     } else {
//         return @"--";
//     }
// }

  factory InstrumentQuote.fromJson(Map<String, dynamic> json) =>
      _$InstrumentQuoteFromJson(json);
  Map<String, dynamic> toJson() => _$InstrumentQuoteToJson(this);
}
