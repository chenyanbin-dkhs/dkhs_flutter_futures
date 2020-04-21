import '../../utils/number_util.dart';

class InstrumentTimeLine {
  String instrument;
  List<TimeLine> timeLine;

  InstrumentTimeLine({this.instrument, this.timeLine});

  InstrumentTimeLine.fromJson(Map<String, dynamic> json) {
    instrument = json['instrument'];
    if (json['time_line'] != null) {
      timeLine = new List<TimeLine>();
      json['time_line'].forEach((v) {
        timeLine.add(new TimeLine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instrument'] = this.instrument;
    if (this.timeLine != null) {
      data['time_line'] = this.timeLine.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeLine {
  // 09:19:00
  String time;
  String price;
  String volume;
  String openVol;
  double percentage(double baseValue) {
    double _price = NumberUtils.doubleParse(price);
    return _price == null ? null : ((_price / baseValue) - 1) * 100;
  }

  TimeLine({this.time, this.price, this.volume, this.openVol});

  TimeLine.fromJson(Map<String, dynamic> json) {
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
