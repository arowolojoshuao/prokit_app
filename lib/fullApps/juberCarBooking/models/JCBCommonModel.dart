

class JCBCommonModel {
  String? title;
  String? subTitle;
  String? image;

  JCBCommonModel({this.title, this.subTitle, this.image});
}

List<JCBCommonModel> jcbPickTimeSelection() {
  List<JCBCommonModel> list = [];

  list.add(JCBCommonModel(title: "Immediate pick-up", subTitle: 'Get a ride in minutes'));
  list.add(JCBCommonModel(title: "Schedule Ride", subTitle: 'Schedule your ride from 60 minutes in advance.'));

  return list;
}

List<JCBCommonModel> jcbPaymentSelection() {
  List<JCBCommonModel> list = [];

  list.add(JCBCommonModel(title: '**** **** **** 5263', subTitle: '09/25', image: 'images/juberCarBooking/jcbIcons/ic_mastercard.png'));
  list.add(JCBCommonModel(title: '**** **** **** 3802', subTitle: '10/27', image: 'images/juberCarBooking/jcbIcons/ic_visa.png'));
  list.add(JCBCommonModel(title: 'petra_stark@email.com', image: 'images/juberCarBooking/jcbIcons/ic_paypal.png'));

  return list;
}

List<JCBCommonModel> jcbGetPromotionsList() {
  List<JCBCommonModel> list = [];

  list.add(JCBCommonModel(title: "10% off the base rate on your next rental", subTitle: 'Valid to 09/25/2019'));
  list.add(JCBCommonModel(title: "Save up to 30% off the base rate on weekly rental", subTitle: 'Valid to 10/25/2019'));
  list.add(JCBCommonModel(title: "Save \$5 per day up to \$15 on your next rental", subTitle: 'Valid to 12/30/2019'));

  return list;
}
