import './statuses_source_model.dart';
import '../accounts/user.dart';

class StatusesModel {
  int id;
  String title;
  String text;
  String description;
  UserModel user;
  int statusType;
  StatusesSourceModel source;
  int viewsCount;
  int contentType;
  int contentSubtype;
  String publishAt;
  String recommendTitle;
  String recommendDesc;
  String recommendImageSm;
  String createdAtRelative;
  int tendency;
  String tendencyDisplay;
  bool liked;

  StatusesModel(
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

  StatusesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    description = json['description'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    statusType = json['status_type'];
    source = json['source'] != null
        ? new StatusesSourceModel.fromJson(json['source'])
        : null;
    viewsCount = json['views_count'];
    contentType = json['content_type'];
    contentSubtype = json['content_subtype'];
    publishAt = json['publish_at'];
    recommendTitle = json['recommend_title'];
    recommendDesc = json['recommend_desc'];
    recommendImageSm = json['recommend_image_sm'];
    createdAtRelative = json['created_at_relative'];
    tendency = json['tendency'];
    tendencyDisplay = json['tendency_display'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['text'] = this.text;
    data['description'] = this.description;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }

    data['status_type'] = this.statusType;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }

    data['views_count'] = this.viewsCount;
    data['content_type'] = this.contentType;
    data['content_subtype'] = this.contentSubtype;
    data['publish_at'] = this.publishAt;

    data['recommend_title'] = this.recommendTitle;
    data['recommend_desc'] = this.recommendDesc;
    data['recommend_image_sm'] = this.recommendImageSm;
    data['created_at_relative'] = this.createdAtRelative;
    data['tendency'] = this.tendency;
    data['tendency_display'] = this.tendencyDisplay;
    data['liked'] = this.liked;
    return data;
  }
}
