import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCSearchModel {
  String image;
  String name;

  RCSearchModel({required this.name, required this.image});
}

List<RCSearchModel> getShareNameList() {
  List<RCSearchModel> list = [];

  list.add(RCSearchModel(name: 'Sushi', image: '$BaseUrl/images/recipe/sushi.png'));
  list.add(RCSearchModel(name: 'Beef Steak', image: '$BaseUrl/images/recipe/walkThroughImages/imageFour.png'));
  list.add(RCSearchModel(name: 'Pasta', image: '$BaseUrl/images/recipe/walkThroughImages/imageThree.png'));
  list.add(RCSearchModel(name: 'Salad', image: '$BaseUrl/images/recipe/salad.png'));
  list.add(RCSearchModel(name: 'Pizza', image: '$BaseUrl/images/recipe/pizza.png'));
  list.add(RCSearchModel(name: 'Noodles', image: '$BaseUrl/images/recipe/walkThroughImages/imageFive.png'));

  return list;
}
