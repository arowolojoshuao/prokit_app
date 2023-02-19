import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RCSortModel {
  String title;
  IconData icon;

  RCSortModel({required this.title, required this.icon});
}

List<RCSortModel> getSortList() {
  List<RCSortModel> list = [];

  list.add(RCSortModel(title: 'Popular', icon: LineIcons.star));
  list.add(RCSortModel(title: 'Latest', icon: LineIcons.clock_1));
  list.add(RCSortModel(title: 'Likes', icon: LineIcons.heart));
  list.add(RCSortModel(title: 'Little time', icon: LineIcons.clock));
  list.add(RCSortModel(title: 'Calories', icon: LineIcons.fire));

  return list;
}
