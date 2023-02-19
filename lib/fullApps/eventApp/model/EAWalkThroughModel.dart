class EAWalkThrough {
  String? title;
  String? subtitle;
  String? image;

  EAWalkThrough({this.title, this.subtitle, this.image});
}

class EACityModel {
  String? name;
  String? subtitle;
  String? image;
  bool? selectHash;
  bool isSelected;

  EACityModel({this.name, this.subtitle, this.image, this.selectHash = false, this.isSelected = false});
}
