import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHRoomListComponent.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHAllRoomScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSettingScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class SHHomeFragment extends StatefulWidget {
  static String tag = '/SHHomeFragment';
  String? title;

  SHHomeFragment({this.title});

  @override
  SHHomeFragmentState createState() => SHHomeFragmentState();
}

class SHHomeFragmentState extends State<SHHomeFragment> {
  List<SHModel> list = getScenesList();
  List<SHModel> homeList = getHomeList();

  int sceneIndex = 0;
  double _sigmaX = 0.0;
  double _sigmaY = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(SHContainerColor);
    //
  }

  int getLength(List<SHDeviceModel> data) {
    int i = 0;
    data.forEach(
      (element) {
        if (element.mIsCheck == true) {
          i += 1;
        }
      },
    );

    return i;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: SHContainerColor,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi \nMorning\'n Cameron!',
                    style: boldTextStyle(color: white, size: 24),
                  ).paddingOnly(left: 16),
                  Align(
                    alignment: Alignment.topRight,
                    child: commonSHCachedNetworkImage(
                      'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ).cornerRadiusWithClipRRectOnly(bottomLeft: 20).onTap(
                      () {
                        SHSettingScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
                      },
                    ),
                  ),
                ],
              ),
              16.height,
              HorizontalList(
                spacing: 0,
                runSpacing: 0,
                padding: EdgeInsets.only(left: 8, right: 8),
                itemCount: list.length,
                itemBuilder: (_, index) {
                  SHModel data = list[index];
                  bool isMyIndex = sceneIndex == index;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isMyIndex
                              ? appStore.isDarkModeOn
                                  ? cardDarkColor
                                  : white
                              : SHScaffoldDarkColor,
                          borderRadius: radius(40),
                          border: Border.all(
                              color: isMyIndex
                                  ? appStore.isDarkModeOn
                                      ? white
                                      : Colors.black
                                  : SHScaffoldDarkColor),
                        ),
                        padding: EdgeInsets.all(12),
                        child: commonSHCachedNetworkImage(
                          data.img,
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ).onTap(() {
                        sceneIndex = index;
                        setState(() {});
                      }, borderRadius: radius(40)),
                      4.height,
                      Text(
                        data.name!,
                        style: isMyIndex ? primaryTextStyle(color: white) : secondaryTextStyle(color: Colors.grey),
                      ),
                    ],
                  ).paddingOnly(left: 8, right: 8);
                },
              ),
              16.height,
              Container(
                width: context.width(),
                height: context.height(),
                decoration: BoxDecoration(
                  color: SHScaffoldDarkColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('View All', style: boldTextStyle(color: white, size: 14)).onTap(
                        () {
                          SHAllRoomScreen().launch(context);
                        },
                      ).paddingOnly(top: 16, right: 16),
                    ),
                    8.height,
                    SHRoomListComponent()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
