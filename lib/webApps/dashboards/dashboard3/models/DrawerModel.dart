import 'package:flutter/material.dart';

class DrawerModel {
  String? name;
  Function? onTap;
  IconData icon;
  int? count;

  DrawerModel({this.name, this.onTap, required this.icon, this.count});
}
