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
  List<StatusesModel> _statuses = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var data = await StatusesHttp().getGategoryTimeline();
    assert(mounted);
    setState(() {
      _statuses = data.results;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_statuses.isEmpty) {
      return SizedBox();
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _statuses.length,
      itemBuilder: (context, index) => StatusesItem(
        statuse: _statuses[index],
      ),
    );
  }
}
