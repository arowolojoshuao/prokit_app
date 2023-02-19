class JCBSearchDestinationModel {
  String name;
  String address;

  JCBSearchDestinationModel({required this.name, required this.address});
}

List<JCBSearchDestinationModel> jcbDestinationsList() {
  List<JCBSearchDestinationModel> list = [];

  list.add(JCBSearchDestinationModel(name: "University of Washington", address: '056 Coralie Mountains Apt. 567'));
  list.add(JCBSearchDestinationModel(name: "Woodland Park", address: '371 Keshwan Knolts Suite 703'));
  list.add(JCBSearchDestinationModel(name: "BMW of Bellevue", address: '13424 NE 20th St Bellevue,WA 98005'));
  list.add(JCBSearchDestinationModel(name: "McDonald\'s", address: '13841 NE 20th St Bellevue,WA 98005'));
  list.add(JCBSearchDestinationModel(name: "Highland Track Fiels", address: 'NE 20th St Bellevue,WA 98005'));

  return list;
}

List<JCBSearchDestinationModel> jcbFavList() {
  List<JCBSearchDestinationModel> list = [];

  list.add(JCBSearchDestinationModel(name: "BMW of Bellevue", address: '13424 NE 20th St Bellevue,WA 98005'));
  list.add(JCBSearchDestinationModel(name: "McDonald\'s", address: '13841 NE 20th St Bellevue,WA 98005'));
  list.add(JCBSearchDestinationModel(name: "Highland Track Fiels", address: 'NE 20th St Bellevue,WA 98005'));

  return list;
}
