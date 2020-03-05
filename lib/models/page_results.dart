// 参考 https://dev.to/edezacas/dart-flutter-serialize-nested-generics-24nn
class PageResults<T> {
  int totalCount;
  int totalPage;
  int currentPage;
  List<T> results;

  PageResults(
      {this.totalCount, this.totalPage, this.currentPage, this.results});

  PageResults.fromJson(Map<String, dynamic> json, Function fromJson) {
    totalCount = json['total_count'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    var _results = [];

    if (json['results'] != null) {
      json['results'].forEach((v) {
        //_results.add(Statuses.fromJson(v));
        _results.add(fromJson(v));
      });
    }
    results = _results.cast<T>();
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['total_count'] = this.totalCount;
  //   data['total_page'] = this.totalPage;
  //   data['current_page'] = this.currentPage;
  //   if (this.results != null) {
  //     data['results'] = this.results.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
