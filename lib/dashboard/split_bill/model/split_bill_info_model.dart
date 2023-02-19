import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/colors.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/images.dart';

class SplitBillInfoModel {
  String? name;
  String? icon;
  Color? iconBgColor;
  String? recentSplitTrailingIcon;
  String? recentSplitTitle;
  String? recentSplitSubTitleAmount;

  SplitBillInfoModel({
    this.name,
    this.icon,
    this.iconBgColor,
    this.recentSplitTrailingIcon,
    this.recentSplitTitle,
    this.recentSplitSubTitleAmount,
  });
}

List<SplitBillInfoModel> getSplitWithList() {
  List<SplitBillInfoModel> tempSplitWith = [];

  tempSplitWith.add(
    SplitBillInfoModel(
      icon: ic_man,
      iconBgColor: customSkinColor,
    ),
  );

  tempSplitWith.add(
    SplitBillInfoModel(
      icon: ic_man2,
      iconBgColor: customLightYellowColor,
    ),
  );
  tempSplitWith.add(
    SplitBillInfoModel(
      icon: ic_man3,
      iconBgColor: customLightPurpleColor,
    ),
  );
  tempSplitWith.add(
    SplitBillInfoModel(
      icon: ic_man,
      iconBgColor: customLightBlueColor,
    ),
  );

  return tempSplitWith;
}

List<SplitBillInfoModel> getNearbyFriendsList() {
  List<SplitBillInfoModel> tempNearbyFriendsInfo = [];

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'Fox',
      icon: ic_man,
      iconBgColor: customLightYellowColor,
    ),
  );

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'Hope',
      icon: ic_man2,
      iconBgColor: customSkinColor,
    ),
  );

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'John',
      icon: ic_man3,
      iconBgColor: customLightPurpleColor,
    ),
  );

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'Smit',
      icon: ic_man,
      iconBgColor: customLightBlueColor,
    ),
  );

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'Rocky',
      icon: ic_man3,
      iconBgColor: customLightPurpleColor,
    ),
  );

  tempNearbyFriendsInfo.add(
    SplitBillInfoModel(
      name: 'Roy',
      icon: ic_man2,
      iconBgColor: customSkinColor,
    ),
  );

  return tempNearbyFriendsInfo;
}

List<SplitBillInfoModel> getRecentSplitIconList() {
  List<SplitBillInfoModel> tempRecentIconSplit = [];

  tempRecentIconSplit.add(
    SplitBillInfoModel(
      recentSplitTrailingIcon: ic_man,
      iconBgColor: customSkinColor,
    ),
  );
  tempRecentIconSplit.add(
    SplitBillInfoModel(
      recentSplitTrailingIcon: ic_man2,
      iconBgColor: customLightYellowColor,
    ),
  );
  tempRecentIconSplit.add(
    SplitBillInfoModel(
      recentSplitTrailingIcon: ic_man3,
      iconBgColor: customLightPurpleColor,
    ),
  );

  return tempRecentIconSplit;
}

List<SplitBillInfoModel> getRecentSplitList() {
  List<SplitBillInfoModel> tempRecentSplit = [];

  tempRecentSplit.add(
    SplitBillInfoModel(
      recentSplitTitle: 'Team Dinner',
      recentSplitSubTitleAmount: '3900',
    ),
  );
  tempRecentSplit.add(
    SplitBillInfoModel(
      recentSplitTitle: 'Single Dinner',
      recentSplitSubTitleAmount: '3000',
    ),
  );
  tempRecentSplit.add(
    SplitBillInfoModel(
      recentSplitTitle: 'Team Dinner',
      recentSplitSubTitleAmount: '3200',
    ),
  );

  return tempRecentSplit;
}
