import 'package:prokit_flutter/main/utils/AppConstant.dart';

class RCReviewModel {
  String foodImage;
  String name;
  String profile;
  String time;

  RCReviewModel({required this.time, required this.name, required this.foodImage, required this.profile});
}

List<RCReviewModel> getReviews() {
  List<RCReviewModel> list = [];

  list.add(RCReviewModel(name: 'Anita Rose', time: '3 min', foodImage: '$BaseUrl/images/recipe/burger.jpg', profile: '$BaseUrl/images/recipe/faceOne.jpg'));
  list.add(RCReviewModel(name: 'Sunny Lu', time: '15 min', foodImage: '$BaseUrl/images/recipe/panCake.jpg', profile: '$BaseUrl/images/recipe/faceTwo.jpg'));
  list.add(RCReviewModel(name: 'Anita Rose', time: '3 min', foodImage: '$BaseUrl/images/recipe/coffee.jpg', profile: '$BaseUrl/images/recipe/faceOne.jpg'));

  return list;
}
