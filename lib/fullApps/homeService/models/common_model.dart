import 'package:flutter/material.dart';

class CommonModel {
  String title;
  String? imagePath;
  Widget? iconPath;
  bool? isSelected;

  CommonModel(this.title, this.imagePath, this.iconPath,{this.isSelected = false});

  CommonModel.withoutIcon(this.title, this.imagePath,{this.isSelected = false});

  CommonModel.withoutImage(this.title, this.iconPath,{this.isSelected = false});
}
