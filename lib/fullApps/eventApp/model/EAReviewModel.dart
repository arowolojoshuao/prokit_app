class EAReviewModel {
  String? name;
  String? image;
  String? msg;
  String? time;
  bool? fev;
  double? rating;
  int? like;

  EAReviewModel({this.name, this.image, this.msg, this.time, this.fev = false, this.rating, this.like});
}
