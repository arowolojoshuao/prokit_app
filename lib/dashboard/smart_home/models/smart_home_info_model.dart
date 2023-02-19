import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/colors.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/images.dart';

class SmartHomeInfoModel {
  String? usageHistoryTitle;
  String? usageHistorySubTitle;
  String? usageHistoryIcons;
  String? usageHistoryUnit;

  String? roomsTitle;
  String? roomsSubTitle;
  String? roomsIcons;
  Color? roomsIconColor;

  String? deviceTitle;
  String? deviceIcon;
  String? deviceStatus;
  bool? deviceToggle;
  Color? deviceIconColor;

  SmartHomeInfoModel({
    this.usageHistoryTitle,
    this.usageHistorySubTitle,
    this.usageHistoryIcons,
    this.usageHistoryUnit,
    this.roomsTitle,
    this.roomsSubTitle,
    this.roomsIcons,
    this.roomsIconColor,
    this.deviceTitle,
    this.deviceIcon,
    this.deviceStatus,
    this.deviceToggle,
    this.deviceIconColor,
  });
}

List<SmartHomeInfoModel> getUsageHistoryList() {
  List<SmartHomeInfoModel> tempUsageHistory = [];

  tempUsageHistory.add(
    SmartHomeInfoModel(
      usageHistoryTitle: '40.56',
      usageHistorySubTitle: 'usage today',
      usageHistoryIcons: ic_thunderbolt,
      usageHistoryUnit: 'kwh',
    ),
  );

  tempUsageHistory.add(
    SmartHomeInfoModel(
      usageHistoryTitle: '48',
      usageHistorySubTitle: 'Save today',
      usageHistoryIcons: ic_dollar,
      usageHistoryUnit: 'dollar',
    ),
  );

  return tempUsageHistory;
}

List<SmartHomeInfoModel> getRoomsInfoList() {
  List<SmartHomeInfoModel> tempRoomInfo = [];

  tempRoomInfo.add(
    SmartHomeInfoModel(
      roomsTitle: 'Bedroom',
      roomsSubTitle: '6 devices',
      roomsIcons: ic_bedroom,
      roomsIconColor: Colors.indigoAccent.shade100,
    ),
  );

  tempRoomInfo.add(
    SmartHomeInfoModel(
      roomsTitle: 'Kitchen',
      roomsSubTitle: '3 devices',
      roomsIcons: ic_kitchen,
      roomsIconColor: roomCustomSkinColor,
    ),
  );

  return tempRoomInfo;
}

List<SmartHomeInfoModel> getDevicesInfoList() {
  List<SmartHomeInfoModel> tempDevicesInfo = [];

  tempDevicesInfo.add(
    SmartHomeInfoModel(
      deviceTitle: 'Air Conditioner',
      deviceStatus: 'On',
      deviceIcon: ic_air_conditioner,
      deviceToggle: true,
      deviceIconColor: deviceCustomPurpleColor,
    ),
  );

  tempDevicesInfo.add(
    SmartHomeInfoModel(
      deviceTitle: 'Lights',
      deviceStatus: 'Off',
      deviceIcon: ic_bulb,
      deviceToggle: false,
      deviceIconColor: deviceCustomYellowColor,
    ),
  );

  tempDevicesInfo.add(
    SmartHomeInfoModel(
      deviceTitle: 'Fan',
      deviceStatus: 'On',
      deviceIcon: ic_fan,
      deviceToggle: true,
      deviceIconColor: deviceCustomPurpleColor,
    ),
  );

  tempDevicesInfo.add(
    SmartHomeInfoModel(
      deviceTitle: 'Washing Machine',
      deviceStatus: 'Off',
      deviceIcon: ic_bulb,
      deviceToggle: false,
      deviceIconColor: deviceCustomPurpleColor,
    ),
  );

  return tempDevicesInfo;
}
