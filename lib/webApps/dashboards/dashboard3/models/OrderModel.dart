import 'package:flutter/material.dart';

class OrderModel {
  IconData? icon;
  String? name;
  int? quantity;
  int? time;
  double? price;
  double change;
  Color? color;

  OrderModel({this.icon, this.name, this.quantity, this.time, this.price, required this.change, this.color});
}
