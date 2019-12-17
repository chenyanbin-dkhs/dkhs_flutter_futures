import 'ads_model.dart';

class AdsAreaModel {
  int id;
  String code;
  List<AdsModel> ads;

  AdsAreaModel({this.id, this.code, this.ads});

  factory AdsAreaModel.fromJson(Map<String, dynamic> json) {
    var list = json['ads'] as List;
    List<AdsModel> adsList = list.map((i) => AdsModel.fromJson(i)).toList();

    return AdsAreaModel(id: json['id'], code: json['code'], ads: adsList);
  }
}

class AdsAreaListModel {
  final List<AdsAreaModel> list;

  AdsAreaListModel({
    this.list,
  });

  factory AdsAreaListModel.fromJson(List<dynamic> parsedJson) {
    List<AdsAreaModel> list = new List<AdsAreaModel>();
    list = parsedJson.map((i) => AdsAreaModel.fromJson(i)).toList();
    return new AdsAreaListModel(list: list);
  }
}
