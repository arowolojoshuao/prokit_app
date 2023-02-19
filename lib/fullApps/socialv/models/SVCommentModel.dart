import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVCommentModel {
  String? name;
  String? profileImage;
  String? time;
  String? comment;
  int? likeCount;
  bool? isCommentReply;
  bool? like;

  SVCommentModel({this.name, this.profileImage, this.time, this.comment, this.likeCount, this.isCommentReply, this.like});
}

List<SVCommentModel> getComments() {
  List<SVCommentModel> list = [];

  list.add(SVCommentModel(
    name: 'Iana',
    profileImage: '$BaseUrl/images/socialv/faces/face_1.png',
    time: '4m',
    likeCount: 4,
    comment: 'Loving😍 your work and profile👨. Top Marks. Once you are confident enough to develop @ira_membrit',
    isCommentReply: false,
    like: false,
  ));
  list.add(SVCommentModel(
    name: 'Allie',
    profileImage: '$BaseUrl/images/socialv/faces/face_2.png',
    time: '4m',
    likeCount: 4,
    comment: 'Nice 👌Work, love your content',
    isCommentReply: false,
    like: false,
  ));
  list.add(SVCommentModel(
    name: 'Manny',
    profileImage: '$BaseUrl/images/socialv/faces/face_3.png',
    time: '4m',
    likeCount: 4,
    comment: 'Thanks 🤟@wad-warren. Follow us for more update',
    isCommentReply: true,
    like: false,
  ));
  list.add(SVCommentModel(
    name: 'Isabelle',
    profileImage: '$BaseUrl/images/socialv/faces/face_4.png',
    time: '4m',
    likeCount: 4,
    comment: 'Really Cool 👍 which filter are you using 🎞@con_trariweis',
    isCommentReply: true,
    like: false,
  ));
  list.add(SVCommentModel(
    name: 'Jenny Wilson',
    profileImage: '$BaseUrl/images/socialv/faces/face_5.png',
    time: '4m',
    likeCount: 4,
    comment: 'Hey Guys✋, I recommend you to try this smart pluginfor design System @Jane_Cooper',
    isCommentReply: false,
    like: false,
  ));
  list.add(SVCommentModel(
    name: 'Iana',
    profileImage: '$BaseUrl/images/socialv/faces/face_1.png',
    time: '4m',
    likeCount: 4,
    comment: 'Great,that awesome work @Jane_Cooper.',
    isCommentReply: false,
    like: false,
  ));

  return list;
}
