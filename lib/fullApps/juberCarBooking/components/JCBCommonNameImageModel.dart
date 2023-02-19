import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBCommonNameImageModel {
  String name;
  String image;

  JCBCommonNameImageModel({required this.name, required this.image});
}

List<JCBCommonNameImageModel> getFavTypes() {
  List<JCBCommonNameImageModel> list = [];

  list.add(JCBCommonNameImageModel(name: 'Home', image: 'images/juberCarBooking/jcbIcons/ic_home.png'));
  list.add(JCBCommonNameImageModel(name: 'Work', image: 'images/juberCarBooking/jcbIcons/ic_suitcase.png'));
  list.add(JCBCommonNameImageModel(name: 'Others', image: 'images/juberCarBooking/jcbIcons/ic_pin.png'));

  return list;
}
