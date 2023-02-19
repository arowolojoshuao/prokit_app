import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFAboutUsScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFHelpScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFNotificationScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFRecentlyViewedScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFImages.dart';

List<RoomFinderModel> categoryList() {
  List<RoomFinderModel> categoryListData = [];
  categoryListData.add(RoomFinderModel(roomCategoryName: "Flat"));
  categoryListData.add(RoomFinderModel(roomCategoryName: "Rooms"));
  categoryListData.add(RoomFinderModel(roomCategoryName: "Hall"));
  categoryListData.add(RoomFinderModel(roomCategoryName: "Rent"));
  categoryListData.add(RoomFinderModel(roomCategoryName: "House"));

  return categoryListData;
}

List<RoomFinderModel> hotelList() {
  List<RoomFinderModel> hotelListData = [];
  hotelListData.add(RoomFinderModel(
      img: rf_hotel1, color: greenColor.withOpacity(0.6), roomCategoryName: "1 BHK at Lalitpur", price: "RS. 8000 / ", rentDuration: "per month", location: "Mahalaxmi Lalitpur", address: "Available", description: "9 Applied | ", views: "20 Views"));
  hotelListData.add(RoomFinderModel(img: rf_hotel2, color: redColor, roomCategoryName: "Big Room", price: "RS. 5000 / ", rentDuration: "per day", location: "Imadol", address: "Unavailable", description: "5 Applied | ", views: "10 Views"));
  hotelListData.add(RoomFinderModel(
      img: rf_hotel3, color: greenColor.withOpacity(0.6), roomCategoryName: "4 Room for Student", price: "RS. 6000 / ", rentDuration: "per week", location: "Kupondole", address: "Available", description: "10 Applied | ", views: "06 Views"));
  hotelListData
      .add(RoomFinderModel(img: rf_hotel4, color: redColor, roomCategoryName: "Hall and Room", price: "RS. 5000 / ", rentDuration: "per month", location: "Koteshwor Lalitpur", address: "Unavailable", description: "16 Applied | ", views: "12 Views"));
  hotelListData
      .add(RoomFinderModel(img: rf_hotel5, color: greenColor.withOpacity(0.6), roomCategoryName: "Big Room", price: "RS. 2000 / ", rentDuration: "per day", location: "Imadol", address: "Available", description: "9 Applied | ", views: "25 Views"));
  hotelListData.add(RoomFinderModel(img: rf_hotel2, color: redColor, roomCategoryName: "Big Room", price: "RS. 5000 / ", rentDuration: "per day", location: "Imadol", address: "Unavailable", description: "5 Applied | ", views: "10 Views"));

  return hotelListData;
}

List<RoomFinderModel> locationList() {
  List<RoomFinderModel> locationListData = [];
  locationListData.add(RoomFinderModel(img: rf_location1, price: "10 Found", location: "Lalitpur"));
  locationListData.add(RoomFinderModel(img: rf_location2, price: "4 Found", location: "Imadol"));
  locationListData.add(RoomFinderModel(img: rf_location3, price: "12 Found", location: "Kupondole"));
  locationListData.add(RoomFinderModel(img: rf_location4, price: "16 Found", location: " Lalitpur"));
  locationListData.add(RoomFinderModel(img: rf_location5, price: "20 Found", location: "Mahalaxmi"));
  locationListData.add(RoomFinderModel(img: rf_location6, price: "25 Found", location: "Koteshwor"));

  return locationListData;
}

List<RoomFinderModel> faqList() {
  List<RoomFinderModel> faqListData = [];
  faqListData.add(
      RoomFinderModel(img: rf_faq, price: "What do we get here in this app?", description: "That which doesn't kill you makes you stronger, right? Unless it almost kills you, and renders you weaker. Being strong is pretty rad though, so go ahead."));
  faqListData
      .add(RoomFinderModel(img: rf_faq, price: "What is the use of this App?", description: "Sometimes, you've just got to say 'the party starts here'. Unless you're not in the place where the aforementioned party is starting. Then, just shut up."));
  faqListData.add(RoomFinderModel(
      img: rf_faq, price: "How to get from location A to B?", description: "If you believe in yourself, go double or nothing. Well, depending on how long it takes you to calculate what double is. If you're terrible at maths, don't."));

  return faqListData;
}

List<RoomFinderModel> notificationList() {
  List<RoomFinderModel> notificationListData = [];
  notificationListData.add(RoomFinderModel(price: "Welcome", unReadNotification: false, description: "Don’t forget to complete your personal info."));
  notificationListData.add(RoomFinderModel(price: "There are 4 available properties, you recently selected. ", unReadNotification: true, description: "Click here for more details."));

  return notificationListData;
}

List<RoomFinderModel> yesterdayNotificationList() {
  List<RoomFinderModel> yesterdayNotificationListData = [];
  yesterdayNotificationListData.add(RoomFinderModel(price: "There are 4 available properties, you recently selected. ", unReadNotification: false, description: "Click here for more details."));
  yesterdayNotificationListData.add(RoomFinderModel(price: "There are 4 available properties, you recently selected. ", unReadNotification: true, description: "Click here for more details."));
  yesterdayNotificationListData.add(RoomFinderModel(price: "There are 4 available properties, you recently selected. ", unReadNotification: true, description: "Click here for more details."));

  return yesterdayNotificationListData;
}

List<RoomFinderModel> settingList() {
  List<RoomFinderModel> settingListData = [];
  settingListData.add(RoomFinderModel(img: rf_notification, roomCategoryName: "Notifications", newScreenWidget: RFNotificationScreen()));
  settingListData.add(RoomFinderModel(img: rf_recent_view, roomCategoryName: "Recent Viewed", newScreenWidget: RFRecentlyViewedScreen()));
  settingListData.add(RoomFinderModel(img: rf_faq, roomCategoryName: "Get Help", newScreenWidget: RFHelpScreen()));
  settingListData.add(RoomFinderModel(img: rf_about_us, roomCategoryName: "About us", newScreenWidget: RFAboutUsScreen()));
  settingListData.add(RoomFinderModel(img: rf_sign_out, roomCategoryName: "Sign Out", newScreenWidget: SizedBox()));

  return settingListData;
}

List<RoomFinderModel> applyHotelList() {
  List<RoomFinderModel> applyHotelListData = [];
  applyHotelListData.add(RoomFinderModel(roomCategoryName: "Applied (5)"));
  applyHotelListData.add(RoomFinderModel(roomCategoryName: "Liked"));

  return applyHotelListData;
}

List<RoomFinderModel> availableHotelList() {
  List<RoomFinderModel> availableHotelListData = [];
  availableHotelListData.add(RoomFinderModel(roomCategoryName: "All Available(14)"));
  availableHotelListData.add(RoomFinderModel(roomCategoryName: "Booked"));

  return availableHotelListData;
}

List<RoomFinderModel> appliedHotelList() {
  List<RoomFinderModel> appliedHotelData = [];
  appliedHotelData.add(RoomFinderModel(img: rf_hotel1, roomCategoryName: "1 BHK at Lalitpur", price: "RS 8000 ", rentDuration: "1.2 km from Gwarko", location: "Mahalaxmi Lalitpur", address: "Booked", views: "3.0"));
  appliedHotelData.add(RoomFinderModel(img: rf_hotel2, roomCategoryName: "Big Room", price: "RS 5000 ", rentDuration: "1.2 km from Mahalaxmi", location: "Imadol", address: "Booked", views: "4.0"));
  appliedHotelData.add(RoomFinderModel(img: rf_hotel3, roomCategoryName: "4 Room for Student", price: "RS 6000 ", rentDuration: "1.2 km from Imadol", location: "Kupondole", address: "Booked", views: "2.5"));
  appliedHotelData.add(RoomFinderModel(img: rf_hotel4, roomCategoryName: "Hall and Room", price: "RS 5000 ", rentDuration: "1.2 km from Kupondole", location: "Koteshwor Lalitpur", address: "Booked", views: "4.5"));
  appliedHotelData.add(RoomFinderModel(img: rf_hotel5, roomCategoryName: "Big Room", price: "RS 2000 ", rentDuration: "1.2 km from Koteshwor", location: "Imadol", address: "Booked", views: "5.0"));

  return appliedHotelData;
}

List<RoomFinderModel> hotelImageList() {
  List<RoomFinderModel> hotelImageListData = [];
  hotelImageListData.add(RoomFinderModel(img: rf_hotel1));
  hotelImageListData.add(RoomFinderModel(img: rf_hotel2));
  hotelImageListData.add(RoomFinderModel(img: rf_hotel3));
  hotelImageListData.add(RoomFinderModel(img: rf_hotel4));

  return hotelImageListData;
}
