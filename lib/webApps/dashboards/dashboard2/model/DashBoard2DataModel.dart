import 'package:flutter/material.dart';

class DashBoard2DataModel {
  String? name;
  int? courseCount;
  String? image;
  String? description;
  String? date;
  Color? color;
  Color? progressbarColor;
  double? progress;
  Color? textColor;
  Function? onTap;
  IconData? icon;
  bool? following;
  int? followers;
  String? categoryName;

  DashBoard2DataModel(
      {this.name,
      this.courseCount,
      this.image,
      this.description,
      this.date,
      this.color,
      this.progressbarColor,
      this.progress,
      this.textColor,
      this.onTap,
      this.icon,
      this.following,
      this.followers,
      this.categoryName});
}
