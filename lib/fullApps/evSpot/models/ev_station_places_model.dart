import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';

class EVStationPlacesModel {
  String? image;
  String? stTitle;
  String? stAddress;
  String? connection;
  String? status;
  bool? wishList;
  List<String>? amenitiesIconText;
  List<String>? amenitiesIconList;

  EVStationPlacesModel({this.image, this.stTitle, this.stAddress, this.connection, this.status, this.wishList, this.amenitiesIconText, this.amenitiesIconList});
}

List<EVStationPlacesModel> getStationList() {
  List<EVStationPlacesModel> temp = [];
  temp.add(
    EVStationPlacesModel(
      image: ev_station1,
      stTitle: 'Shiv Complex',
      stAddress: 'A23, World Trade Park, New York',
      connection: '4 Points',
      wishList: false,
      amenitiesIconText: ['Washroom', 'Wifi', 'Foods', 'Pharmacy', 'Shopping'],
      amenitiesIconList: [ic_washroom, ic_wifi, ic_foods, ic_pharmacy, ic_shopping],
    ),
  );
  temp.add(
    EVStationPlacesModel(
      image: ev_station2,
      stTitle: 'Plaza Centre',
      stAddress: 'A19, Big Market, New York',
      connection: '5 Points',
      status: 'Open',
      wishList: true,
      amenitiesIconText: ['Washroom', 'Wifi', 'Pharmacy'],
      amenitiesIconList: [ic_washroom, ic_wifi, ic_pharmacy],
    ),
  );
  temp.add(
    EVStationPlacesModel(
      image: ev_station3,
      stTitle: 'Shoping Centre',
      stAddress: 'A18, Junathana, New York',
      wishList: true,
      amenitiesIconText: ['Washroom'],
      amenitiesIconList: [ic_washroom],
    ),
  );
  temp.add(
    EVStationPlacesModel(
      image: splash_image,
      stTitle: 'Sindhi Camp',
      stAddress: 'A23, Kaliawadi, New York',
      connection: '8 Points',
      status: 'Open',
      wishList: false,
      amenitiesIconText: ['Foods', 'Pharmacy'],
      amenitiesIconList: [ic_foods, ic_pharmacy],
    ),
  );
  temp.add(
    EVStationPlacesModel(
      image: ev_station2,
      stTitle: 'Business Park',
      stAddress: 'A34, Grid Road, New York',
      connection: '4 Points',
      status: 'Open',
      wishList: true,
      amenitiesIconText: ['Wifi', 'Washroom', 'Pharmacy', 'Foods'],
      amenitiesIconList: [ic_wifi, ic_washroom, ic_pharmacy, ic_foods],
    ),
  );
  return temp;
}
