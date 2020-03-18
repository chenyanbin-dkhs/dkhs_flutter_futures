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

  /// 根据合约里的 timeRange，返回一个完整的分时数组
  List<TimeLine> fullTimeline(List<String> fullTimeRanges) {
    if (this.timeLine == null || this.timeLine.length == 0) {
      return [];
    }
    List<TimeLine> list = [];

    for (var i = 0; i < fullTimeRanges.length; i++) {
      TimeLine timeline = this.timeLine.firstWhere(
          (element) => element.time.substring(0, 5) == fullTimeRanges[i],
          orElse: () => null);

      if (timeline == null) {
        list.add(TimeLine(
            time: fullTimeRanges[i], price: null, volume: null, openVol: null));
      } else {
        list.add(timeline);
      }
    }
    return list;
  }
}

class TimeLine {
  String time;
  String price;
  String volume;
  String openVol;

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
