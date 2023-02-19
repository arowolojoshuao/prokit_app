import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/SampleListModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class MWDrawerScreen5 extends StatefulWidget {
  const MWDrawerScreen5({Key? key}) : super(key: key);

  @override
  _MWDrawerScreen5State createState() => _MWDrawerScreen5State();
}

class _MWDrawerScreen5State extends State<MWDrawerScreen5> {
  List<SampleListModel> getData = [];

  late int isSelected = 0;

  double value = 0;

  bool d1Open = false;

  @override
  void initState() {
    setStatusBarColor(appStore.scaffoldBackground!);

    getData.add(
      SampleListModel(
        title: "Home",
        icon: Icons.home,
        launchWidget: Text("Home View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Profile",
        icon: Icons.account_box_rounded,
        launchWidget: Text("Profile View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Notification",
        icon: Icons.notifications_none,
        launchWidget: Text("Notification View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Stats",
        icon: Icons.stacked_bar_chart,
        launchWidget: Text("Stats View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Schedule",
        icon: Icons.access_time,
        launchWidget: Text("Schedule View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Settings",
        icon: Icons.settings,
        launchWidget: Text("Settings View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    init();
    super.initState();
  }

  void closeDrawer() {
    value = 0;
    d1Open = false;
    setStatusBarColor(appStore.scaffoldBackground!);
  }

  openDrawer() {
    value = 1;
    d1Open = true;
    setStatusBarColor(Colors.transparent);
    setState(() {});
  }

  void init() async {
    await Future.delayed(Duration(seconds: 1)).then((value) => openDrawer());
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade400,
                  Colors.blue.shade800,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    40.height,
                    Icon(Icons.account_circle, color: Colors.white, size: 70),
                    8.height,
                    Text('Rebeca Babara', style: boldTextStyle(color: Colors.white, size: 20)),
                  ],
                ).paddingLeft(16),
                32.height,
                Column(
                  children: [
                    ...List.generate(
                      getData.length,
                      (index) {
                        SampleListModel data = getData[index];
                        return SettingItemWidget(
                          title: data.title.validate(),
                          titleTextStyle: primaryTextStyle(color: isSelected == index ? Colors.white : Colors.white54),
                          leading: Icon(
                            data.icon,
                            color: isSelected == index ? Colors.white : Colors.white54,
                          ),
                          onTap: () {
                            isSelected = index;
                            closeDrawer();
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ).paddingAll(8),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 250),
            builder: (_, double val, __) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: GestureDetector(
                  onTap: () {
                    closeDrawer();
                    setState(() {});
                  },
                  onPanUpdate: (d) {
                    closeDrawer();
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: d1Open ? radius(16) : radius(0),
                      color: context.scaffoldBackgroundColor,
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(d1Open ? Icons.arrow_back : Icons.menu, size: 24),
                                onPressed: () {
                                  if (d1Open) {
                                    closeDrawer();
                                  } else {
                                    value = 1;
                                    d1Open = true;
                                    setStatusBarColor(Colors.blue.shade800);
                                  }
                                  setState(() {});
                                },
                              ),
                              8.width,
                              Text('Hello, User', style: boldTextStyle(size: 20)),
                            ],
                          ),
                          Column(
                            children: [
                              getData[isSelected].launchWidget.validate(),
                              16.height,
                              AppButton(
                                text: 'Go Back',
                                textStyle: boldTextStyle(color: Colors.white),
                                color: appColorPrimary,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).center(),
                          0.height,
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
