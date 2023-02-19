import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHRoomScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class SHRoomListComponent extends StatefulWidget {
  const SHRoomListComponent({Key? key}) : super(key: key);

  @override
  _SHRoomListComponentState createState() => _SHRoomListComponentState();
}

class _SHRoomListComponentState extends State<SHRoomListComponent> {
  List homeList = getHomeList();
  double _sigmaX = 0.0;
  double _sigmaY = 0.0;

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
  Widget build(BuildContext context) {
    return HorizontalList(
      itemCount: homeList.length,
      spacing: 0,
      runSpacing: 0,
      padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      itemBuilder: (_, index) {
        SHModel homeData = homeList[index];

        return Container(
          margin: EdgeInsets.all(4),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              commonSHCachedNetworkImage(
                homeData.img,
                fit: BoxFit.cover,
                height: context.height() * 0.45,
                width: 230,
              ).cornerRadiusWithClipRRect(20).onTap(
                () {
                  SHRoomScreen(
                    title: homeData.name,
                    list: homeList[index].shDeviceModel!,
                  ).launch(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                height: 120,
                width: 230,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(500),
                      blurRadius: 15.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  color: Colors.white.withAlpha(100),
                  border: Border.all(
                    color: Colors.white10.withAlpha(80),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(homeData.name!, style: boldTextStyle(color: white, size: 20)),
                        Text(
                          "${getLength(homeList[index].shDeviceModel!)}" + "/" + "${homeData.shDeviceModel!.length}",
                          style: secondaryTextStyle(color: white),
                        ),
                      ],
                    ),
                    16.height,
                    HorizontalList(
                      itemCount: homeList[index].shDeviceModel!.length,
                      padding: EdgeInsets.all(8),
                      itemBuilder: (_, i) {
                        SHDeviceModel deviceData = homeList[index].shDeviceModel![i];
                        return BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: deviceData.mIsCheck! ? context.cardColor : null,
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Image.asset(
                              deviceData.deviceImg.validate(),
                              fit: BoxFit.cover,
                              height: 25,
                              width: 25,
                              color: deviceData.mIsCheck!
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : black
                                  : white,
                            ),
                          ).onTap(
                            () {
                              setState(
                                () {
                                  deviceData.mIsCheck = !deviceData.mIsCheck!;

                                  deviceData.status = !deviceData.mIsCheck! ? "ON" : "OFF";

                                  setState(() {});
                                },
                              );
                            },
                          ),
                        ).paddingSymmetric(horizontal: 4, vertical: 2);
                      },
                    )
                  ],
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 8),
        );
      },
    );
  }
}
