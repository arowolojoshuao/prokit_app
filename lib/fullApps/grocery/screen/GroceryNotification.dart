import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';

class GroceryNotification extends StatefulWidget {
  static String tag = '/GroceryNotification';

  @override
  GroceryNotificationState createState() => GroceryNotificationState();
}

class GroceryNotificationState extends State<GroceryNotification> {
  late List<NotificationModel> mList;

  @override
  void initState() {
    super.initState();
    mList = notificationItem();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, width * 0.25),
        child: TopBar(Icons.close, grocery_title_notifications, Icons.notifications, () {}),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today", style: boldTextStyle()),
                Text(grocery_lbl_clear_all, style: boldTextStyle(color: grocery_colorPrimary)),
              ],
            ).paddingAll(spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Notification(mList[index], index);
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Notification extends StatelessWidget {
  late NotificationModel model;

  Notification(NotificationModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(spacing_standard),
      margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new),
      decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? scaffoldDarkColor : white),
            width: width * 0.12,
            height: width * 0.12,
            padding: EdgeInsets.all(width * 0.02),
            child: Icon(Icons.notifications_none, color: grocery_colorPrimary),
          ),
          8.width,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.name, style: boldTextStyle()),
                  Text(model.duration, style: secondaryTextStyle()),
                ],
              ),
              4.height,
              Text(model.description, style: secondaryTextStyle()),
            ],
          ).expand()
        ],
      ),
    );
  }
}
