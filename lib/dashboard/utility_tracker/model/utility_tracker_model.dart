import 'package:prokit_flutter/dashboard/utility_tracker/utils/images.dart';

class UtilityTrackerModel {
  String? userName;
  String? profileIcon;
  String? month;
  String? days;
  String? amount;
  String? utilityIcons;
  String? utilityAmount;
  String? utilityTitle;
  String? messagesName;
  String? complainText;
  String? lastSeen;

  UtilityTrackerModel({
    this.userName,
    this.profileIcon,
    this.month,
    this.days,
    this.amount,
    this.utilityIcons,
    this.utilityAmount,
    this.utilityTitle,
    this.messagesName,
    this.complainText,
    this.lastSeen,
  });
}

UtilityTrackerModel userData = UtilityTrackerModel(
  userName: 'Minnie Lehmann',
  profileIcon: img_user,
  month: 'August',
  days: '5',
  amount: '431.90',
);

List<UtilityTrackerModel> getUtilityTrackerInfo() {
  List<UtilityTrackerModel> tempUtilityTrackerInfo = [];

  tempUtilityTrackerInfo.add(
    UtilityTrackerModel(
      utilityIcons: ic_plug,
      utilityAmount: '250.90',
      utilityTitle: 'Electricity',
    ),
  );

  tempUtilityTrackerInfo.add(
    UtilityTrackerModel(
      utilityIcons: ic_water,
      utilityAmount: '126.10',
      utilityTitle: 'Water',
    ),
  );

  tempUtilityTrackerInfo.add(
    UtilityTrackerModel(
      utilityIcons: ic_trash,
      utilityAmount: '35.00',
      utilityTitle: 'Trash',
    ),
  );

  tempUtilityTrackerInfo.add(
    UtilityTrackerModel(
      utilityIcons: ic_wifi,
      utilityAmount: '19.90',
      utilityTitle: 'Wifi',
    ),
  );

  return tempUtilityTrackerInfo;
}

List<UtilityTrackerModel> getMessagesList() {
  List<UtilityTrackerModel> tempMessagesList = [];

  tempMessagesList.add(
    UtilityTrackerModel(
      messagesName: 'John Cina',
      complainText: 'Problem with hot water',
      lastSeen: '5',
    ),
  );

  tempMessagesList.add(
    UtilityTrackerModel(
      messagesName: 'Steven Smith',
      complainText: 'Problem with wifi',
      lastSeen: '10',
    ),
  );

  tempMessagesList.add(
    UtilityTrackerModel(
      messagesName: 'Rocky',
      complainText: 'Problem with electricity',
      lastSeen: '8',
    ),
  );

  tempMessagesList.add(
    UtilityTrackerModel(
      messagesName: 'Josh Butler',
      complainText: 'Problem with wastage overflow',
      lastSeen: '15',
    ),
  );

  return tempMessagesList;
}
