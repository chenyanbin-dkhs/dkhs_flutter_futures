import 'package:json_annotation/json_annotation.dart';
part 'instrument_time_ranges.g.dart';

@JsonSerializable()
class InstrumentTimeRanges {
  String start;
  String end;

  InstrumentTimeRanges({this.start, this.end});

  factory InstrumentTimeRanges.fromJson(Map<String, dynamic> json) =>
      _$InstrumentTimeRangesFromJson(json);
  Map<String, dynamic> toJson() => _$InstrumentTimeRangesToJson(this);
}
