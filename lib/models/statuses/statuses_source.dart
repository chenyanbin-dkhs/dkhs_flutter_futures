import 'package:json_annotation/json_annotation.dart';
part 'statuses_source.g.dart';

@JsonSerializable()
class StatusesSource {
  int id;
  String title;

  StatusesSource({this.id, this.title});
  factory StatusesSource.fromJson(Map<String, dynamic> json) =>
      _$StatusesSourceFromJson(json);
  Map<String, dynamic> toJson() => _$StatusesSourceToJson(this);
}
