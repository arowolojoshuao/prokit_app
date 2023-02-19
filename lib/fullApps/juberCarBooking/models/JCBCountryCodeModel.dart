class JCBCountryCodeModel {
  String name;
  String code;

  JCBCountryCodeModel({required this.name, required this.code});
}

List<JCBCountryCodeModel> jcbGetCountryCodes() {
  List<JCBCountryCodeModel> list = [];

  list.add(JCBCountryCodeModel(name: "Afghanistan", code: '+93'));
  list.add(JCBCountryCodeModel(name: "Albania", code: '+355'));
  list.add(JCBCountryCodeModel(name: "Algeria", code: '+213'));
  list.add(JCBCountryCodeModel(name: "American Samoa", code: '+1684'));

  return list;
}
