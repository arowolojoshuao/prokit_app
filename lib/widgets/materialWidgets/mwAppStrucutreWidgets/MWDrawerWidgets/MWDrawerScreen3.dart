import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/SampleListModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class MWDrawerScreen3 extends StatefulWidget {
  const MWDrawerScreen3({Key? key}) : super(key: key);

  @override
  _MWDrawerScreen3State createState() => _MWDrawerScreen3State();
}

class _MWDrawerScreen3State extends State<MWDrawerScreen3> {
  List<SampleListModel> getData = [];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool d1Open = false;

  late int isSelected = 0;

  closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    scaleFactor = 1;
    d1Open = false;
    setStatusBarColor(appStore.scaffoldBackground!);
  }

  openDrawer() {
    xOffset = 200;
    yOffset = 80;
    scaleFactor = 0.8;
    d1Open = true;
    setStatusBarColor(Color(0xff335a5a));
    setState(() {});
  }

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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xff335a5a),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.account_circle, color: Colors.white, size: 50),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rebeca Babara', style: boldTextStyle(color: Colors.white, size: 20)),
                          Text('Designer', style: secondaryTextStyle(color: Colors.white54)),
                        ],
                      ),
                    ],
                  ).paddingOnly(left: 16, top: 24),
                  24.height,
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
                  Spacer(),
                  TextIcon(
                    text: "Logout",
                    prefix: Icon(Icons.logout),
                    onTap: () {
                      closeDrawer();
                      setState(() {});
                    },
                  ).paddingOnly(left: 16, bottom: 24),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                closeDrawer();
                setState(() {});
              },
              child: AnimatedContainer(
                decoration: boxDecorationDefault(
                  color: Colors.white,
                  borderRadius: radius(d1Open ? 16 : 0),
                ),
                duration: Duration(milliseconds: 200),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    color: context.scaffoldBackgroundColor,
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
                                  xOffset = 200;
                                  yOffset = 80;
                                  scaleFactor = 0.8;
                                  d1Open = true;
                                  setStatusBarColor(Color(0xff335a5a));
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
              onPanUpdate: (d) {
                closeDrawer();
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
