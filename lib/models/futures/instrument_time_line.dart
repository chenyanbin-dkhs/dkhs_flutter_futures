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

  Map<String, TimeLine> fullTimelineMap(Map<String, TimeLine> originTimeLines) {
    if (this.timeLine == null || this.timeLine.length == 0) {
      return originTimeLines;
    }
    for (var i = 0; i < timeLine.length; i++) {
      originTimeLines[timeLine[i].time.substring(0, 5)] = timeLine[i];
    }
    return originTimeLines;
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
