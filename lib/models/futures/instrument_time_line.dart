class InstrumentTimeLine {
  String time;
  String price;
  String volume;
  String openVol;

  InstrumentTimeLine({this.time, this.price, this.volume, this.openVol});

  InstrumentTimeLine.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    price = json['price'];
    volume = json['volume'];
    openVol = json['open_vol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['price'] = this.price;
    data['volume'] = this.volume;
    data['open_vol'] = this.openVol;
    return data;
  }
}
