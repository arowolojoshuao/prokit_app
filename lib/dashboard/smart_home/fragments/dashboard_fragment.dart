import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/smart_home/component/devices_component.dart';
import 'package:prokit_flutter/dashboard/smart_home/component/rooms_component.dart';
import 'package:prokit_flutter/dashboard/smart_home/component/usage_history_component.dart';
import 'package:prokit_flutter/dashboard/smart_home/models/smart_home_info_model.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/colors.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/common.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/images.dart';
import 'package:prokit_flutter/main.dart';

import '../utils/constant.dart';

class DashBoardFragment extends StatefulWidget {
  @override
  _DashBoardFragmentState createState() => _DashBoardFragmentState();
}

class _DashBoardFragmentState extends State<DashBoardFragment> {
  List<SmartHomeInfoModel> setUsageHistoryDetail = getUsageHistoryList();
  List<SmartHomeInfoModel> setRoomsDetail = getRoomsInfoList();
  List<SmartHomeInfoModel> setDevicesDetail = getDevicesInfoList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(gradient: appStore.isDarkModeOn ? primaryHomeLinearGradient() : primaryHomeLinearDarkGradient()),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Sweet Home', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                          6.height,
                          Text('John Wick', style: primaryTextStyle(size: 18)),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            //
                          },
                          icon: Image.asset(ic_home_setting, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                        ),
                      ),
                    ],
                  ),
                  30.height,
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: radius(DEFAULT_RADIUS),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          appStore.isDarkModeOn ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.9),
                          appStore.isDarkModeOn ? Colors.black38.withOpacity(0.2) : primaryHomeColor1,
                        ],
                        stops: [0, 0.9],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sunday,', style: boldTextStyle(size: 18)),
                            6.height,
                            Text('10 November', style: boldTextStyle(size: 18)),
                          ],
                        ),
                        Row(
                          children: [
                            Text('18\u02DA', style: boldTextStyle(size: 30)),
                            8.width,
                            Image.asset(ic_rainy_day, color: appStore.isDarkModeOn ? Colors.white : Colors.black, height: 20, width: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Usage History', style: primaryTextStyle()),
                      showAllLists(context),
                    ],
                  ),
                  8.height,
                  Wrap(
                    children: List.generate(setUsageHistoryDetail.length, (index) {
                      SmartHomeInfoModel usageHistoryData = setUsageHistoryDetail[index];
                      return UsageHistoryComponent(usageHistoryData: usageHistoryData);
                    }),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rooms', style: primaryTextStyle()),
                      showAllLists(context),
                    ],
                  ),
                  16.height,
                  Wrap(
                    spacing: 28,
                    direction: Axis.horizontal,
                    children: List.generate(setRoomsDetail.length, (index) {
                      SmartHomeInfoModel roomData = setRoomsDetail[index];
                      return RoomsComponent(roomData: roomData);
                    }),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Devices', style: primaryTextStyle()),
                      showAllLists(context),
                    ],
                  ),
                  16.height,
                  Wrap(
                    runSpacing: 16,
                    children: List.generate(setDevicesDetail.length, (index) {
                      SmartHomeInfoModel devicesData = setDevicesDetail[index];
                      return DevicesComponent(deviceData: devicesData);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
