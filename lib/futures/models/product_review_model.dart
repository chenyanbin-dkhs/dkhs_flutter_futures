class ProductReviewModel {
  String reviewAt;
  String sectorTypeDisplay;
  String reviewTypeDisplay;
  String instrumentName;
  String suggestion;
  double resistancePrice;
  double supportPrice;

  ProductReviewModel(
      {this.reviewAt,
      this.sectorTypeDisplay,
      this.reviewTypeDisplay,
      this.instrumentName,
      this.suggestion,
      this.resistancePrice,
      this.supportPrice});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    reviewAt = json['review_at'];
    sectorTypeDisplay = json['sector_type_display'];
    reviewTypeDisplay = json['review_type_display'];
    instrumentName = json['instrument_name'];
    suggestion = json['suggestion'];
    resistancePrice = json['resistance_price'];
    supportPrice = json['support_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_at'] = this.reviewAt;
    data['sector_type_display'] = this.sectorTypeDisplay;
    data['review_type_display'] = this.reviewTypeDisplay;
    data['instrument_name'] = this.instrumentName;
    data['suggestion'] = this.suggestion;
    data['resistance_price'] = this.resistancePrice;
    data['support_price'] = this.supportPrice;
    return data;
  }
}

class ProductReviewListModel {
  int totalCount;
  int totalPage;
  int currentPage;
  List<ProductReviewModel> results;

  ProductReviewListModel(
      {this.totalCount, this.totalPage, this.currentPage, this.results});

  ProductReviewListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    totalPage = json['total_page'];
    currentPage = json['current_page'];
    if (json['results'] != null) {
      results = new List<ProductReviewModel>();
      json['results'].forEach((v) {
        results.add(new ProductReviewModel.fromJson(v));
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
