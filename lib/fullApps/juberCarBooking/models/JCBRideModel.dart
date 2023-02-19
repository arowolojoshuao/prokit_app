import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBRideModel {
  String title;
  String subTitle;
  String cost;
  String time;
  bool? isBest;
  String image;

  JCBRideModel({required this.title, required this.subTitle, required this.cost, required this.time, this.isBest, required this.image});
}

List<JCBRideModel> getRideTypes() {
  List<JCBRideModel> list = [];

  list.add(JCBRideModel(
    title: 'JuberGo',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_go.png',
    cost: '\$25.50',
    isBest: true,
    subTitle: 'Best Save',
    time: '1-4 min',
  ));
  list.add(JCBRideModel(
    title: 'Jubercar',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_car.png',
    cost: '\$35.00',
    isBest: false,
    subTitle: '4 seats',
    time: '1-5 min',
  ));
  list.add(JCBRideModel(
    title: 'Juberbike',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_bike.png',
    cost: '\$10.00',
    isBest: false,
    subTitle: 'Pay Less',
    time: '1-5 min',
  ));
  list.add(JCBRideModel(
    title: 'Jubercar7',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_car7.png',
    cost: '\$65.00',
    isBest: false,
    subTitle: '7 seats',
    time: '1-5 min',
  ));
  list.add(JCBRideModel(
    title: 'Jubercar4',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_car4.png',
    cost: '\$45.00',
    isBest: false,
    subTitle: '4 seats',
    time: '1-5 min',
  ));
  list.add(JCBRideModel(
    title: 'Jubertaxi',
    image: '$BaseUrl/images/juberCarBooking/juberRides/juber_taxi.png',
    cost: '\$40.00',
    isBest: false,
    subTitle: '4 seats',
    time: '1-5 min',
  ));

  return list;
}

List<JCBRideModel> getMyRides() {
  List<JCBRideModel> list = [];

  list.add(JCBRideModel(
    title: 'JuberGo',
    image: '$BaseUrl/images/juberCarBooking/jcb_map.png',
    cost: '\$25.50',
    subTitle: 'Seattle - 280 Hemlock Ln',
    time: 'Today, 10 : 30 AM',
  ));
  list.add(JCBRideModel(
    title: 'Jubercar',
    image: '$BaseUrl/images/juberCarBooking/jcb_map.png',
    cost: '\$35.00',
    subTitle: 'Home - Woodland Park',
    time: 'May 29,2022  08:15 AM',
  ));

  return list;
}
