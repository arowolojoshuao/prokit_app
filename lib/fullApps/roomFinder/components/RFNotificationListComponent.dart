import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFImages.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:prokit_flutter/main.dart';

class RFNotificationListComponent extends StatelessWidget {
  final bool? readNotification;
  final String? title;
  final String? subTitle;

  RFNotificationListComponent({this.readNotification, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationWithRoundedCorners(
        border: Border.all(color: readNotification.validate() ? gray.withOpacity(0.3) : rf_splashBgColor.withOpacity(0.2)),
        backgroundColor: context.cardColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : rf_notificationBgColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Stack(
              children: [
                rf_notification.iconImage(iconColor: appStore.isDarkModeOn ? white : black),
                Positioned(
                  top: 1,
                  right: 1,
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      backgroundColor: readNotification.validate() ? redColor : Colors.transparent,
                    ),
                  ),
                )
              ],
            ),
          ),
          16.width,
          rfCommonRichText(
            title: title.validate(),
            subTitle: subTitle.validate(),
            titleTextStyle: primaryTextStyle(),
            subTitleTextStyle: boldTextStyle(),
          ).flexible()
        ],
      ),
    );
  }
}
