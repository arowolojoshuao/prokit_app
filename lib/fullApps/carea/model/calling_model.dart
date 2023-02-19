import 'package:flutter/material.dart';

class CallingModel {
  String? imageUrl;
  String? userName;
  IconData? icon;
  Color? colorValue;
  String? subTitle;
  String? countNumber;
  String? arriveTime;
  bool? selectCarCategory;

  CallingModel({
    this.imageUrl,
    this.userName,
    this.icon,
    this.colorValue,
    this.subTitle,
    this.countNumber,
    this.arriveTime,
    this.selectCarCategory,
  });
}

class BHMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  BHMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
