class UserModel {
  int id;
  String username;
  String avatarXs;

  UserModel({this.id, this.username, this.avatarXs});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatarXs = json['avatar_xs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar_xs'] = this.avatarXs;
    return data;
  }
}
