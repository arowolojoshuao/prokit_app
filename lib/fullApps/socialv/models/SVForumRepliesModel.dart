import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVForumRepliesModel {
  String? name;
  String? date;
  String? hashTagNo;
  String? subTitle;
  String? description;
  String? profileImage;
  bool? isOfficial;

  SVForumRepliesModel({this.date, this.hashTagNo, this.subTitle, this.name, this.description, this.profileImage, this.isOfficial});
}

List<SVForumRepliesModel> getRepliesList() {
  List<SVForumRepliesModel> list = [];

  list.add(SVForumRepliesModel(
    name: 'Mal Nurrisht',
    date: '25 Feb, 2022 at 05:30 AM',
    hashTagNo: '123',
    subTitle: 'Public Group',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
    profileImage: '$BaseUrl/images/socialv/faces/face_1.png',
  ));
  list.add(SVForumRepliesModel(
    name: 'Mal Nurrisht',
    date: '25 Feb, 2022 at 05:30 AM',
    hashTagNo: '123',
    subTitle: 'Public Group',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
    profileImage: '$BaseUrl/images/socialv/faces/face_2.png',
  ));

  list.add(SVForumRepliesModel(
    name: 'Mal Nurrisht',
    date: '25 Feb, 2022 at 05:30 AM',
    hashTagNo: '123',
    subTitle: 'Public Group',
    description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
    profileImage: '$BaseUrl/images/socialv/faces/face_3.png',
  ));

  return list;
}
