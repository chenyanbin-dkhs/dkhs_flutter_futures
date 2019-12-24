import 'package:flutter/material.dart';
import 'package:flustars/flustars.dart';
import 'package:collection/collection.dart';
import '../../../models/product_review_model.dart';
import '../../../res/resources.dart';
import '../../../utils/image_utils.dart';
import '../../../widgets/item_click.dart';
import '../../../http/futures_http.dart';

const SECTOR_SPACER_WIDTH = 10; // 每个板块之间的间隔
const GAPS_WIDTH = 30; //左右边距
const double SECTOR_HEIGHT = 25;
const double SECTOR_HEIGHT_ACTIVE = 28.5;
final Color backgroundColor = Color(0xfff76836).withOpacity(0.15);

class HomeProductReview extends StatefulWidget {
  HomeProductReview({Key key}) : super(key: key);

  @override
  _HomeProductReviewState createState() => _HomeProductReviewState();
}

class _HomeProductReviewState extends State<HomeProductReview> {
  List<String> sectors = [];
  List<ProductReviewModel> products = [];

  int currentIndex = 0;
  // Iterable<String> tableHeaders;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var data = await FuturesHttp().getProductReviews();
    if (data.results.length > 0) {
      var dataGroup = groupBy(data?.results, (obj) => obj.sectorTypeDisplay);
      setState(() {
        sectors = dataGroup.keys.toList().cast<String>();
        products = data?.results;
      });
    }
  }

  List filterProduct(int sectorIndex) {
    return products
        .where((o) => o.sectorTypeDisplay == sectors[sectorIndex])
        .toList();
  }

  Widget buildProductRow(ProductReviewModel productReview) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(const Radius.circular(5))),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              tableRowCell(productReview.instrumentName),
              tableRowCell(productReview.resistancePrice.toString(),
                  alignment: Alignment.centerRight),
              tableRowCell(productReview.supportPrice.toString(),
                  alignment: Alignment.centerRight),
              tableRowCell(productReview.suggestion,
                  alignment: Alignment.centerRight),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (products == null || products.length == 0) return SizedBox();
    return Padding(
        padding: Gaps.hPadding,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sectors
                  .asMap()
                  .map((index, value) =>
                      MapEntry(index, _buildSectorWidget(index, value)))
                  .values
                  .toList(),
            ),
            Gaps.vGap5,
            Container(
              color: backgroundColor,
              padding: Gaps.hPadding10,
              child: Column(
                children: <Widget>[
                  Table(children: [
                    TableRow(
                      children: [
                        tableHeaderCell("合约名称"),
                        tableHeaderCell("压力位",
                            alignment: Alignment.centerRight),
                        tableHeaderCell("支撑位",
                            alignment: Alignment.centerRight),
                        tableHeaderCell("操作建议",
                            alignment: Alignment.centerRight),
                      ],
                    ),
                  ]),
                  for (var item in filterProduct(currentIndex))
                    buildProductRow(item),
                  Gaps.vGap10,
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildSectorWidget(int index, String title) {
    bool isActive = index == currentIndex;
    double screenWidth = ScreenUtil.getInstance().screenWidth;
    int total = sectors.length;
    double sectorWidth =
        (screenWidth - GAPS_WIDTH - (total - 1) * SECTOR_SPACER_WIDTH) / total;

    return ItemClick(
      child: Container(
        height: isActive ? SECTOR_HEIGHT_ACTIVE : SECTOR_HEIGHT,
        width: sectorWidth,
        decoration: buttonBackground(isActive),
        child: Center(
          child: Container(
            padding: isActive
                ? const EdgeInsets.only(
                    bottom: SECTOR_HEIGHT_ACTIVE - SECTOR_HEIGHT)
                : const EdgeInsets.only(bottom: 0),
            child: Text(
              title,
              style: TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  BoxDecoration buttonBackground(bool isActive) {
    return isActive
        ? BoxDecoration(
            image: DecorationImage(
              image: ImageUtils.getAssetImage('home/btn_sector'),
              fit: BoxFit.fill,
            ),
          )
        : BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(const Radius.circular(5)),
          );
  }

  Widget tableRowCell(String title,
      {AlignmentGeometry alignment: Alignment.centerLeft}) {
    return Container(
        height: 40,
        padding: Gaps.hPadding10,
        child: Align(
          alignment: alignment,
          child: Text(title),
        ));
  }

  Widget tableHeaderCell(String title,
      {AlignmentGeometry alignment: Alignment.centerLeft}) {
    return Container(
        height: 30,
        padding: Gaps.hPadding10,
        child: Align(
          alignment: alignment,
          child: Text(title,
              style: TextStyle(
                  fontSize: Dimens.font_sp12, color: Color(0xff8f949d))),
        ));
  }
}
