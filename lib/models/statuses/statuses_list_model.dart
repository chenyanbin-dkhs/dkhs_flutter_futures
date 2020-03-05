import './statuses.dart';

class StatusesListModel {
  int totalCount;
  int totalPage;
  int currentPage;
  List<Statuses> results;

  StatusesListModel(
      {this.totalCount, this.totalPage, this.currentPage, this.results});

  StatusesListModel.fromJson(Map<String, dynamic> json, Function fromJson) {
    totalCount = json['total_count'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    // 参考 https://dev.to/edezacas/dart-flutter-serialize-nested-generics-24nn
    if (json['results'] != null) {
      results = new List<Statuses>();
      json['results'].forEach((v) {
        results.add(Statuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['total_page'] = this.totalPage;
    data['current_page'] = this.currentPage;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
