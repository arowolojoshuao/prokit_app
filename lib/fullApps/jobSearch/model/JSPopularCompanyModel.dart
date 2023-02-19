import 'package:flutter/cupertino.dart';

class JSPopularCompanyModel {
  String? companyImage;
  String? companyName;
  double? companyRatting;
  String? totalReview;
  bool? selectSkill;
  Widget? widget;
  Icon? drawerIcon;
  bool? isBlocked;
  String? totalDays;
  int? index;
  String? dateAnswere;
  String? jobLocation;
  String? jobDescription;
  String? deegryName;
  String? deegryCompleteYear;
  String? deegryDescription;

  JSPopularCompanyModel(
      {this.companyImage,
      this.companyName,
      this.companyRatting,
      this.totalReview,
      this.selectSkill,
      this.widget,
      this.drawerIcon,
      this.isBlocked,
      this.totalDays,
      this.index,
      this.dateAnswere,
      this.jobLocation,
      this.jobDescription,
      this.deegryName,
      this.deegryCompleteYear,
      this.deegryDescription});
}
