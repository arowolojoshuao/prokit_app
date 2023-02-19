import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/smart_home/models/smart_home_info_model.dart';
import 'package:prokit_flutter/main.dart';
import "package:prokit_flutter/dashboard/smart_home/utils/constant.dart";

class RoomsComponent extends StatelessWidget {
  const RoomsComponent({
    Key? key,
    required this.roomData,
  }) : super(key: key);

  final SmartHomeInfoModel roomData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appStore.isDarkModeOn ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.5),
        borderRadius: radius(DEFAULT_RADIUS),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: roomData.roomsIconColor!.withOpacity(0.3), shape: BoxShape.circle),
            child: Image.asset(roomData.roomsIcons!, height: 22, width: 22, color: roomData.roomsIconColor!),
          ),
          8.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${roomData.roomsTitle}', style: primaryTextStyle()),
              5.height,
              Text('${roomData.roomsSubTitle}', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white70 : Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
