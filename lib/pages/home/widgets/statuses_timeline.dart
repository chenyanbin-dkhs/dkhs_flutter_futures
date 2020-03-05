import 'package:flutter/material.dart';
import '../../../http/statuses_http.dart';
import '../../../models/statuses/statuses_list_model.dart';
import '../../../models/statuses/statuses.dart';
import '../../../models/page_results.dart';

import '../../statuses/widgets/statuses_item.dart';
import '../../../widgets/list_header.dart';
import '../../../widgets/item_click.dart';

class StatusesTimeline extends StatefulWidget {
  StatusesTimeline({Key key}) : super(key: key);

  @override
  _StatusesTimelineState createState() => _StatusesTimelineState();
}

class _StatusesTimelineState extends State<StatusesTimeline> {
  Future<PageResults<Statuses>> statuses;

  @override
  void initState() {
    super.initState();
    statuses = StatusesHttp().getGategoryTimeline();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<PageResults<Statuses>>(
            future: statuses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildList(snapshot.data.results);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }

  Widget _buildList(List<Statuses> _statuses) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ItemClick(
            child: ListHeader(
              title: '期货资讯',
              note: '更多',
              showLeading: true,
            ),
            onTap: () {},
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _statuses.length,
            itemBuilder: (context, index) => StatusesItem(
              statuse: _statuses[index],
            ),
          )
        ]);
  }
}
