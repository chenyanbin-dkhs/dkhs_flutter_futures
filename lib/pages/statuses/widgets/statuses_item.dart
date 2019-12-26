import 'package:dkhs_flutter_futures/res/gaps.dart';
import 'package:flutter/material.dart';
import '../models/statuses_model.dart';
import '../../../widgets/load_image.dart';
import '../../../widgets/item_click.dart';

class StatusesItem extends StatelessWidget {
  final StatusesModel statuse;
  const StatusesItem({Key key, @required this.statuse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemClick(
      onTap: (){},
      child: Container(
        height: 100,
        padding: Gaps.defaultPadding,
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black26, width: 0.2))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          statuse.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              statuse.source.title,
                            ),
                            Gaps.hGap10,
                            Text(statuse.viewsCount.toString() + '阅读'),
                            Gaps.hGap10,
                            Text(statuse.createdAtRelative),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 80,
              margin: const EdgeInsets.only(left: 10),
              child: LoadImage(
                statuse.recommendImageSm,
                height: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
