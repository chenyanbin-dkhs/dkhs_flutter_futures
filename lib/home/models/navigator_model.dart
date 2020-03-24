class NavigatorModel {
  String title;
  String icon;
  String get activeIcon => icon + '_active';

  NavigatorModel({this.title, this.icon});
}
