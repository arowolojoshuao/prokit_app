import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSDrawerScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/components/JSSettingComponent.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';

class JSSettingScreen extends StatefulWidget {
  const JSSettingScreen({Key? key}) : super(key: key);

  @override
  _JSSettingScreenState createState() => _JSSettingScreenState();
}

class _JSSettingScreenState extends State<JSSettingScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
    return Scaffold(
      key: scaffoldKey,
      drawer: JSDrawerScreen(),
      appBar: jsAppBar(context, notifications: true, message: true, bottomSheet: true, backWidget: true, homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Text("Settings", style: boldTextStyle(size: 28)).paddingOnly(left: 16),
          8.height,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 0),
              8.height,
              SettingItemWidget(
                title: "Account Settings",
                titleTextStyle: boldTextStyle(size: 18),
                subTitle: "Contact information and password",
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
              Divider(height: 0),
              SettingItemWidget(
                title: "Privacy Settings",
                titleTextStyle: boldTextStyle(size: 18),
                subTitle: "Information about Indeed privacy settings",
                leading: Icon(Icons.lock_sharp),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
              16.height,
              Divider(),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "nd15n545lnz@privaterelay.applied.com",
                    style: boldTextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).flexible(),
                  Icon(Icons.arrow_forward_ios, size: 18),
                ],
              ).paddingSymmetric(horizontal: 16),
              16.height,
              Divider(height: 0),
              JSSettingComponent().expand(),
            ],
          ).expand(),
        ],
      ).paddingOnly(bottom: 16),
    );
  }
}
