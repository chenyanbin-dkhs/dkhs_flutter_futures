import './statuses_source.dart';
import '../accounts/user.dart';

import 'package:json_annotation/json_annotation.dart';
part 'statuses.g.dart';

@JsonSerializable(explicitToJson: true)
class Statuses {
  int id;
  String title;
  String text;
  String description;
  User user;
  @JsonKey(name: 'status_type')
  int statusType;

  StatusesSource source;

  @JsonKey(name: 'views_count')
  int viewsCount;

  @JsonKey(name: 'content_type')
  int contentType;

  @JsonKey(name: 'content_subtype')
  int contentSubtype;

  @JsonKey(name: 'publish_at')
  String publishAt;

  @JsonKey(name: 'recommend_title')
  String recommendTitle;

  @JsonKey(name: 'recommend_desc')
  String recommendDesc;

  @JsonKey(name: 'recommend_image_sm')
  String recommendImageSm;

  @JsonKey(name: 'created_at_relative')
  String createdAtRelative;
  int tendency;
  @JsonKey(name: 'tendency_display')
  String tendencyDisplay;
  bool liked;

  Statuses(
      {this.id,
      this.title,
      this.text,
      this.description,
      this.user,
      this.statusType,
      this.source,
      this.viewsCount,
      this.contentType,
      this.contentSubtype,
      this.publishAt,
      this.recommendTitle,
      this.recommendDesc,
      this.recommendImageSm,
      this.createdAtRelative,
      this.tendency,
      this.tendencyDisplay,
      this.liked});

  static Statuses fromJson(Map<String, dynamic> json) =>
      _$StatusesFromJson(json);

  // factory Statuses.fromJson(Map<String, dynamic> json) =>
  //     _$StatusesFromJson(json);
  Map<String, dynamic> toJson() => _$StatusesToJson(this);
}
