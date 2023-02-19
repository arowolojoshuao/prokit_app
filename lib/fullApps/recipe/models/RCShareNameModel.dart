import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCShareNameModel {
  String name;
  String path;

  RCShareNameModel({required this.name, required this.path});
}

List<RCShareNameModel> getShareNameList() {
  List<RCShareNameModel> list = [];

  list.add(RCShareNameModel(name: 'Anita', path: '$BaseUrl/images/recipe/faceOne.jpg'));
  list.add(RCShareNameModel(name: 'Sunny', path: '$BaseUrl/images/recipe/faceTwo.jpg'));
  list.add(RCShareNameModel(name: 'Maya', path: '$BaseUrl/images/recipe/faceThree.jpg'));
  list.add(RCShareNameModel(name: 'Lunna', path: '$BaseUrl/images/recipe/faceOne.jpg'));

  return list;
}
