import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/model/BHModel.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHColors.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHConstants.dart';
import 'package:prokit_flutter/fullApps/hairSalon/utils/BHDataProvider.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class BHNotificationScreen extends StatefulWidget {
  static String tag = '/NotificationScreen';

  @override
  BHNotificationScreenState createState() => BHNotificationScreenState();
}

class BHNotificationScreenState extends State<BHNotificationScreen> {
  List<BHNotificationModel> notificationList = getNotificationList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(BHTxtNotification, style: boldTextStyle(size: 18)),
        centerTitle: true,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              finish(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: notificationList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: BHAppDividerColor, width: 0.6),
              color: context.cardColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonCacheImageWidget(notificationList[index].img, 80, width: 80, fit: BoxFit.cover),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notificationList[index].name!, style: boldTextStyle()),
                    8.height,
                    Text(notificationList[index].msg!, style: secondaryTextStyle()),
                  ],
                ).expand(),
                Column(
                  children: [
                    Text(notificationList[index].status!, style: secondaryTextStyle()),
                    8.height,
                    Image.asset(
                      notificationList[index].callInfo!,
                      color: BHColorPrimary,
                      height: 25,
                      width: 25,
                    ).paddingOnly(right: 8),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
