import 'package:flutter/material.dart';

class StockInvestModel {
  String? image;
  String? title;
  String? subTitle;
  String? stockPrice;
  String? profit;
  String? stockScale;
  Color? priceColor;
  Color? imageBackground;
  Icon? icon;
  IconData? settingIcon;

  StockInvestModel({this.settingIcon, this.image, this.profit, this.title, this.subTitle, this.stockPrice, this.stockScale, this.priceColor, this.imageBackground, this.icon});
}
