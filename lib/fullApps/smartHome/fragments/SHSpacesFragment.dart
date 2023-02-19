import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHAllDevicesScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHNewDeviceScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHNewRoomScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHRoomScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';

class SHSpacesFragment extends StatefulWidget {
  static String tag = '/SHSpacesFragment';

  @override
  SHSpacesFragmentState createState() => SHSpacesFragmentState();
}

class SHSpacesFragmentState extends State<SHSpacesFragment> {
  List<SHModel> homeList = getHomeList();
  List<SHDeviceModel> devicesList = getAllDevicesList();

  int selectedIndex = 0;
  int? deviceData;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(SHScaffoldDarkColor, statusBarIconBrightness: Brightness.dark);
    //
  }

  int getLength(List<SHDeviceModel> data) {
    int i = 0;
    data.forEach((element) {
      if (element.mIsCheck == true) {
        i += 1;
      }
    });

    return i;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor.withOpacity(0.1),
      appBar: AppBar(
        title: Text("My Spaces", style: boldTextStyle(color: white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: SHScaffoldDarkColor,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            color: SHContainerColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            icon: Icon(Icons.add, color: white),
            onSelected: (int value) async {
              if (value == 1) {
                SHDeviceModel data = await SHNewRoomScreen().launch(context);
                SHModel newData = SHModel(
                  shDeviceModel: data.sublist,
                  img: data.deviceImg,
                  subtitle: data.deviceSubTitle,
                  name: data.deviceTitle,
                );
                homeList.add(newData);
              } else {
                SHNewDeviceScreen().launch(context);
              }

              setState(() {});
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("New Room", style: boldTextStyle(color: white)),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("New Device", style: boldTextStyle(color: white)),
                value: 2,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("Rooms", style: boldTextStyle(color: white, size: 22)),
                4.width,
                Text("(${homeList.length})", style: secondaryTextStyle(color: white.withOpacity(0.4), size: 18)),
              ],
            ).paddingOnly(top: 16, right: 16, left: 16, bottom: 8),
            HorizontalList(
              itemCount: homeList.length,
              spacing: 0,
              runSpacing: 0,
              padding: EdgeInsets.all(8),
              itemBuilder: (_, index) {
                SHModel homeData = homeList[index];

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    commonSHCachedNetworkImage(
                      homeData.img,
                      fit: BoxFit.cover,
                      height: 270,
                      width: 160,
                    ).onTap(() {
                      SHRoomScreen(
                        list: homeData.shDeviceModel,
                        title: homeData.name,
                      ).launch(context);
                    }, borderRadius: radius(20)).cornerRadiusWithClipRRect(20),
                    Container(
                      padding: EdgeInsets.only(top: 8, left: 16),
                      height: 60,
                      width: 160,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(500),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        color: Colors.white.withAlpha(100),
                        border: Border.all(color: Colors.white10.withAlpha(80)),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(homeData.name.validate(), style: boldTextStyle(color: white)),
                            4.height,
                            Text(
                              "${getLength(homeList[index].shDeviceModel.validate())}" + "/" + "${homeData.shDeviceModel.validate().length}",
                              style: secondaryTextStyle(color: white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ).paddingSymmetric(horizontal: 8);
              },
            ),
            Row(
              children: [
                Text("Devices", style: boldTextStyle(color: white, size: 22)),
                4.width,
                Text("(${devicesList.length})", style: secondaryTextStyle(color: white.withOpacity(0.4), size: 18)),
              ],
            ).paddingOnly(top: 16, right: 16, left: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 160,
                child: Row(
                  children: [
                    HorizontalList(
                      itemCount: devicesList.length,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        SHDeviceModel data = devicesList[index];

                        return Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(4),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: SHContainerColor,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Column(
                            children: [
                              Image.asset(data.deviceImg.validate(), fit: BoxFit.cover, height: 30, width: 30, color: white),
                              8.height,
                              Text(data.deviceTitle!, style: boldTextStyle(color: white)),
                              4.height,
                              Text(data.deviceSubTitle!, style: secondaryTextStyle(color: gray)),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(right: 16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        backgroundColor: SHScaffoldDarkColor.withOpacity(0.1),
                        border: Border.all(color: gray),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.apps,
                            color: white,
                          ),
                          8.height,
                          Text("View All", style: boldTextStyle(color: white)),
                          4.height,
                          Text("", style: boldTextStyle(color: white)),
                        ],
                      ),
                    ).onTap(
                      () {
                        SHAllDevicesScreen().launch(context);
                      },
                      borderRadius: radius(24),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
