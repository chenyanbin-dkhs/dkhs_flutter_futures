import 'package:flutter/material.dart';
import '../http/statuses_http.dart';
import '../models/statuses_model.dart';
import './statuses_item.dart';

class Statuseslist extends StatefulWidget {
  Statuseslist({Key key}) : super(key: key);

  @override
  _StatuseslistState createState() => _StatuseslistState();
}

class _StatuseslistState extends State<Statuseslist> {
  List<StatusesModel> statuses = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var data = await StatusesHttp().getGategoryTimeline();
    assert(mounted);
    setState(() {
      statuses = data.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (statuses.isEmpty) {
      return SizedBox();
    }
    // todo 这里用ListView.Builder 会报错
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var item in statuses)
          StatusesItem(
            statuse: item,
          )
      ],
    );
  }
}
