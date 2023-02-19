import 'package:flutter/material.dart';

class CPDataModel {
  String? cardName;
  String? image;
  String? currencyName;
  String? currencyUnit;
  String? totalAmount;
  Color? bgColor;
  bool like;
  Color? textColor;
  IconData? icon;
  String? percentage;

  CPDataModel({this.textColor, this.cardName, this.image, this.currencyName, this.currencyUnit, this.totalAmount, this.bgColor, this.like = false, this.icon, this.percentage});
}
