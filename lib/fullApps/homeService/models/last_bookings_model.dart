import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';

import 'active_bookings_model.dart';

List<LastBookingsModel> lastBooking = getLastBooking();

class LastBookingsModel {
  int id;
  String serviceName;
  String name;
  String date;
  String time;
  String status;
  int price;

  //Todo add Image
  LastBookingsModel(this.id, this.serviceName, this.name, this.date, this.time, this.status, this.price);
}

List<LastBookingsModel> getLastBooking() {
  List<LastBookingsModel> list = List.empty(growable: true);
  list.add(
    LastBookingsModel(0, "Full House Cleaning", "Jaylon Cleaning Services", "Jan 4,2022", "4am", "Completed", 2599),
  );
  list.add(
    LastBookingsModel(1, "Kitchen Cleaning", "Sj Cleaning Services", "Dec 4,2022", "6am", "Cancelled", 3000),
  );
  list.add(
    LastBookingsModel(2, "Bedroom Cleaning", "John Cleaning Services", "Feb 17,2022", "6am", "Completed", 2499),
  );
  return list;
}

void againBooking(int id) {
  int newId = activeBooking.last.id++;
  activeBooking.add(
    ActiveBookingsModel(
      newId,
      lastBooking[id].serviceName,
      home,
      lastBooking[id].name,
      lastBooking[id].date,
      lastBooking[id].time,
      "In Process",
      lastBooking[id].price,
    ),
  );
}
