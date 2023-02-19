import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/SampleListModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class MWDrawerScreen4 extends StatefulWidget {
  const MWDrawerScreen4({Key? key}) : super(key: key);

  @override
  _MWDrawerScreen4State createState() => _MWDrawerScreen4State();
}

class _MWDrawerScreen4State extends State<MWDrawerScreen4> {
  List<SampleListModel> getData = [];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double angle = 0;

  bool d1Open = false;

  late int isSelected = 0;

  closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    angle = 0;
    scaleFactor = 1;
    d1Open = false;
    setStatusBarColor(appStore.scaffoldBackground!);
  }

  openDrawer() {
    xOffset = 200;
    yOffset = 80;
    scaleFactor = 0.8;
    angle = 6.18;
    d1Open = true;
    setStatusBarColor(Color(0xFF6A66BB));
    setState(() {});
  }

  @override
  void initState() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.initState();
    getData.add(
      SampleListModel(
        title: "Payment",
        icon: Icons.payment,
        launchWidget: Text("Payment View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Promo",
        icon: Icons.card_giftcard,
        launchWidget: Text("Promo View", style: boldTextStyle(size: 24)).center(),
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
        title: "Help",
        icon: Icons.help_outline_outlined,
        launchWidget: Text("Help View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "About Us",
        icon: Icons.info_outline,
        launchWidget: Text("About Us View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    getData.add(
      SampleListModel(
        title: "Rate Us",
        icon: Icons.star_border,
        launchWidget: Text("Rate Us View", style: boldTextStyle(size: 24)).center(),
      ),
    );
    init();
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
              color: Color(0xFF6A66BB),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Column(
                    children: [
                      ...List.generate(
                        getData.length,
                        (index) {
                          SampleListModel data = getData[index];
                          return SettingItemWidget(
                            title: data.title.validate(),
                            decoration: BoxDecoration(color: isSelected == index ? Color(0xFF513AAF) : Colors.transparent),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: radius(32),
                    ),
                    child: TextIcon(
                      text: "Logout",
                      textStyle: boldTextStyle(color: Colors.white),
                      prefix: Icon(Icons.logout, color: Colors.white),
                      onTap: () {
                        closeDrawer();
                        setState(() {});
                      },
                    ),
                  ).paddingOnly(left: 16, bottom: 24)
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                closeDrawer();
                setState(() {});
              },
              onPanUpdate: (d) {
                closeDrawer();
                setState(() {});
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: boxDecorationDefault(
                  color: context.scaffoldBackgroundColor,
                  borderRadius: d1Open ? radius(16) : radius(0),
                ),
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor)
                  ..rotateZ(angle),
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
                              angle = 6.18;
                              d1Open = true;
                              setStatusBarColor(Color(0xFF6A66BB));
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
            )
          ],
        ),
      ),
    );
  }
}
