import 'package:flutter/material.dart';
import '../../../res/resources.dart';
import '../../../utils/image_utils.dart';
import '../../../widgets/image_container.dart';
import '../../../widgets/item_click.dart';

class HomeProductReview extends StatefulWidget {
  HomeProductReview({Key key}) : super(key: key);

  @override
  _HomeProductReviewState createState() => _HomeProductReviewState();
}

class _HomeProductReviewState extends State<HomeProductReview> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Gaps.hPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: productSectors(),
      ),
    );
  }

  List<Widget> productSectors() {
    return ['黑色板块', '有色板块', '化工板块', '农副板块']
        .asMap()
        .map(
            (index, value) => MapEntry(index, _buildSectorWidget(index, value)))
        .values
        .toList();
  }

  Widget _buildSectorWidget(int index, String title) {
    bool isActive = index == currentIndex;
    return ItemClick(
      child: Container(
        height: isActive ? 28.5 : 25,
        width: 80,
        decoration: buttonBackground(isActive),
        child: Center(
          child: Container(
            padding: isActive
                ? const EdgeInsets.only(bottom: 3.5)
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
              fit: BoxFit.contain,
            ),
          )
        : BoxDecoration(
            color: Color(0xfff76836).withOpacity(0.15),
            borderRadius: const BorderRadius.all(const Radius.circular(5)),
          );
  }
}
