import 'package:flutter/material.dart';

import 'common_model.dart';

List<CommonModel> homeConstruction = getHomeConstruction();

List<CommonModel> getHomeConstruction() {
  List<CommonModel> homeConstruction = [];
  homeConstruction.add(CommonModel.withoutImage("Construction", Icon(Icons.construction, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Architects", Icon(Icons.architecture, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Interior Design", Icon(Icons.house_siding, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Furniture", Icon(Icons.vertical_split_rounded, size: 30)));
  homeConstruction.add(CommonModel.withoutImage("Contractor", Icon(Icons.person, size: 30)));

  return homeConstruction;
}
