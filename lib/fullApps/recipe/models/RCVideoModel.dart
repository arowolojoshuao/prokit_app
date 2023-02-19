import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCVideoModel {
  String path;
  String title;
  String time;
  String views;

  RCVideoModel({required this.path, required this.title, required this.time, required this.views});
}

List<RCVideoModel> getvideoList() {
  List<RCVideoModel> list = [];

  list.add(RCVideoModel(title: 'How to halve cherry tomatoes', path: '$BaseUrl/images/recipe/strawberryCupcake.jpg', time: '01:37 min', views: '381 views'));
  list.add(RCVideoModel(title: 'How to grate cheese', path: '$BaseUrl/images/recipe/panCake.jpg', time: '01:37 min', views: '381 views'));
  list.add(RCVideoModel(title: 'How to halve cherry tomatoes', path: '$BaseUrl/images/recipe/pizza.jpg', time: '01:37 min', views: '381 views'));

  return list;
}
