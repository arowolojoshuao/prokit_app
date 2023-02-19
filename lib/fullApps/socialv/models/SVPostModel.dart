import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVPostModel {
  String? name;
  String? profileImage;
  String? postImage;
  String? time;
  String? description;
  int? commentCount;
  bool? like;

  SVPostModel({this.name, this.profileImage, this.postImage, this.time, this.description, this.commentCount, this.like});
}

List<SVPostModel> getPosts() {
  List<SVPostModel> list = [];

  list.add(
    SVPostModel(
      name: 'Manny',
      profileImage: '$BaseUrl/images/socialv/faces/face_3.png',
      time: '4m',
      postImage: '$BaseUrl/images/socialv/postImage.png',
      description: 'The great thing about reaching the top of the mountain is realising that there’s space for more than one person.',
      commentCount: 0,
      like: false,
    ),
  );
  list.add(
    SVPostModel(
      name: 'Isabelle',
      profileImage: '$BaseUrl/images/socialv/faces/face_4.png',
      time: '4m',
      postImage: '$BaseUrl/images/socialv/postImage.png',
      commentCount: 0,
      like: false,
    ),
  );
  list.add(
    SVPostModel(
      name: 'Jenny Wilson',
      profileImage: '$BaseUrl/images/socialv/faces/face_5.png',
      time: '4m',
      postImage: '$BaseUrl/images/socialv/postImage.png',
      description: 'Making memories that last a lifetime ',
      commentCount: 0,
      like: false,
    ),
  );

  return list;
}
