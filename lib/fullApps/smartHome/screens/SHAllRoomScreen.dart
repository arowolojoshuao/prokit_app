import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/model/SHModel.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHRoomScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHDataProvider.dart';
import 'package:prokit_flutter/main.dart';

class SHAllRoomScreen extends StatefulWidget {
  @override
  SHAllRoomScreenState createState() => SHAllRoomScreenState();
}

class SHAllRoomScreenState extends State<SHAllRoomScreen> {
  List<SHModel> homeList = getHomeList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      appBar: appBarWidget(
        '',
        elevation: 0,
        showBack: false,
        color: SHScaffoldDarkColor,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.arrow_back, color: white),
            ),
            Text('All Rooms', style: boldTextStyle(color: white)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: white),
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        shrinkWrap: true,
        itemCount: homeList.length,
        itemBuilder: (_, index) {
          SHModel homeData = homeList[index];

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              commonSHCachedNetworkImage(
                homeData.img,
                fit: BoxFit.cover,
                height: context.height() * 0.3,
                width: context.width(),
              ).cornerRadiusWithClipRRect(20).onTap(
                () {
                  SHRoomScreen(title: homeData.name, list: homeData.shDeviceModel!).launch(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(top: 8),
                height: 120,
                width: context.width(),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black.withAlpha(200), blurRadius: 15.0, spreadRadius: 0.0),
                  ],
                  color: Colors.white.withAlpha(100),
                  border: Border.all(color: Colors.white10.withAlpha(80)),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(homeData.name!, style: boldTextStyle(color: white)),
                        Text(
                          "${getLength(homeList[index].shDeviceModel!)}" + "/" + "${homeData.shDeviceModel!.length}",
                          style: secondaryTextStyle(color: white),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    16.height,
                    HorizontalList(
                      spacing: 0,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      itemCount: homeData.shDeviceModel!.length,
                      itemBuilder: (_, index) {
                        SHDeviceModel deviceData = homeData.shDeviceModel![index];
                        return Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: white),
                            borderRadius: BorderRadius.circular(40),
                            color: deviceData.mIsCheck! ? context.cardColor : null,
                          ),
                          child: Image.asset(
                            deviceData.deviceImg.validate(),
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                            color: deviceData.mIsCheck!
                                ? appStore.isDarkModeOn
                                    ? white
                                    : black
                                : white,
                          ),
                        ).onTap(
                          () {
                            deviceData.mIsCheck = !deviceData.mIsCheck!;
                            setState(() {});
                          },
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 8, vertical: 8);
        },
      ),
    );
  }
}
