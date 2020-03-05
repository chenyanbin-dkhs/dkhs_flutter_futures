// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statuses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statuses _$StatusesFromJson(Map<String, dynamic> json) {
  return Statuses(
    id: json['id'] as int,
    title: json['title'] as String,
    text: json['text'] as String,
    description: json['description'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    statusType: json['status_type'] as int,
    source: json['source'] == null
        ? null
        : StatusesSource.fromJson(json['source'] as Map<String, dynamic>),
    viewsCount: json['views_count'] as int,
    contentType: json['content_type'] as int,
    contentSubtype: json['content_subtype'] as int,
    publishAt: json['publish_at'] as String,
    recommendTitle: json['recommend_title'] as String,
    recommendDesc: json['recommend_desc'] as String,
    recommendImageSm: json['recommend_image_sm'] as String,
    createdAtRelative: json['created_at_relative'] as String,
    tendency: json['tendency'] as int,
    tendencyDisplay: json['tendency_display'] as String,
    liked: json['liked'] as bool,
  );
}

Map<String, dynamic> _$StatusesToJson(Statuses instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'description': instance.description,
      'user': instance.user?.toJson(),
      'status_type': instance.statusType,
      'source': instance.source?.toJson(),
      'views_count': instance.viewsCount,
      'content_type': instance.contentType,
      'content_subtype': instance.contentSubtype,
      'publish_at': instance.publishAt,
      'recommend_title': instance.recommendTitle,
      'recommend_desc': instance.recommendDesc,
      'recommend_image_sm': instance.recommendImageSm,
      'created_at_relative': instance.createdAtRelative,
      'tendency': instance.tendency,
      'tendency_display': instance.tendencyDisplay,
      'liked': instance.liked,
    };
