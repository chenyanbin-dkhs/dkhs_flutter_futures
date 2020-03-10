import 'package:flutter/material.dart';

import '../../../http/statuses_http.dart';
import '../../../models/statuses/statuses.dart';
import '../../statuses/widgets/statuses_item.dart';
import '../../statuses/widgets/statuses_item_fake.dart';
import '../../../res/resources.dart';
import '../../../widgets/list_header.dart';
import '../../../widgets/item_click.dart';
import '../../../widgets/async_loader.dart';

class StatusesTimeline extends StatelessWidget {
  const StatusesTimeline({Key key}) : super(key: key);
  // final GlobalKey<AsyncLoaderState> _asyncLoaderState =
  //     new GlobalKey<AsyncLoaderState>();
  @override
  Widget build(BuildContext context) {
    var _asyncLoader = AsyncLoader(
      // key: _asyncLoaderState,
      init: () async => await StatusesHttp().getGategoryTimeline(),
      loading: () => Column(children: [
        ...[1, 2, 3, 4, 5].map(
          (item) => StatusesItemFake(),
        )
      ]),
      error: ([error]) => Center(child: Text(error.toString())),
      success: ({data}) => _buildList(data.results),
    );

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
          _asyncLoader,
        ]);
  }

  Widget _buildList(List<Statuses> _statuses) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _statuses.length,
      itemBuilder: (context, index) => StatusesItem(
        statuse: _statuses[index],
      ),
    );
  }
}
