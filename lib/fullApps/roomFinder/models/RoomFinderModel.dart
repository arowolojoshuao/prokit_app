import 'package:flutter/material.dart';

class RoomFinderModel {
  String? img;
  String? roomCategoryName;
  String? description;
  String? address;
  String? price;
  String? rentDuration;
  String? location;
  String? views;
  bool? unReadNotification;
  Widget? newScreenWidget;
  Color? color;

  RoomFinderModel({this.img, this.roomCategoryName, this.description, this.color, this.address, this.price, this.rentDuration, this.location, this.views, this.unReadNotification, this.newScreenWidget});
}
