import 'package:flutter/material.dart';

class SHModel {
  String? img;
  String? name;
  String? subtitle;
  String? email;
  List<SHDeviceModel>? shDeviceModel;
  String? status;
  bool? isDeviceSwitchStatus;
  Widget? screen;
  bool? isSelected;

  SHModel({
    this.img,
    this.name,
    this.subtitle,
    this.email,
    this.shDeviceModel,
    this.status,
    this.isDeviceSwitchStatus,
    this.screen,
    this.isSelected = false,
  });
}

class SHDeviceModel {
  String? deviceImg;
  String? deviceTitle;
  String? deviceType;
  String? deviceSubTitle;
  String? status;
  bool? mIsCheck;
  List<SHDeviceModel>? sublist;
  Widget? deviceComponent;
  double? sliderValue;

  SHDeviceModel({
    this.deviceImg,
    this.deviceTitle,
    this.mIsCheck = false,
    this.deviceType,
    this.status = "OFF",
    this.sublist,
    this.deviceComponent,
    this.deviceSubTitle,
    this.sliderValue,
  });
}

class ExpenseData {
  String? expanseCategory;
  num? father;
  num? mother;
  num? son;
  num? daughter;

  ExpenseData({this.expanseCategory, this.father, this.mother, this.son, this.daughter});
}
