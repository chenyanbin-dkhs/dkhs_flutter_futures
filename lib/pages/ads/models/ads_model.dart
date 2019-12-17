class AdsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String redirectUrl;
  final String badge;

  AdsModel(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.redirectUrl,
      this.badge});

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      redirectUrl: json['redirect_url'],
      badge: json['badge'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['redirect_url'] = this.redirectUrl;
    data['badge'] = this.badge;
    return data;
  }
}
