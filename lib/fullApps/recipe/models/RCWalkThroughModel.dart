class RCWalkThroughModel {
  String? title;
  String? subtitle;
  String? image;

  RCWalkThroughModel({this.title, this.subtitle, this.image});
}

List<RCWalkThroughModel> getListWalkThrough() {
  List<RCWalkThroughModel> list = [];

  list.add(RCWalkThroughModel(title: 'Get Inspired', subtitle: 'Discover delicious recipes and funny food stories.'));
  list.add(RCWalkThroughModel(title: 'Sharpen Your Skills', subtitle: 'With our Cooking Videos and top Tips.'));
  list.add(RCWalkThroughModel(title: 'Shape Your Recipes', subtitle: 'With our international community.'));

  return list;
}
