import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSCompleteComponent extends StatefulWidget {
  static String tag = '/LSCompleteComponent';

  @override
  LSCompleteComponentState createState() => LSCompleteComponentState();
}

class LSCompleteComponentState extends State<LSCompleteComponent> {
  ValueNotifier<int> buttonClickedTimes = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    buttonClickedTimes.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(),
      width: context.width(),
      color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.height,
            commonCacheImageWidget(LSWalk2, 110, fit: BoxFit.cover).center(),
            16.height,
            Text('Thank you For Choosing Us!', style: boldTextStyle(size: 24)).center(),
            8.height,
            Text('You pickup has been confirmed', style: primaryTextStyle()).center(),
            Container(
              margin: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shop Name', style: boldTextStyle()),
                      Text('Dhobee Laundry', style: primaryTextStyle()),
                    ],
                  ).paddingOnly(left: 16, right: 16, top: 8),
                  4.height,
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order ID', style: boldTextStyle()),
                      Text('20122324097', style: primaryTextStyle()),
                    ],
                  ).paddingOnly(left: 16, right: 16, top: 8),
                  4.height,
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Final Amount', style: boldTextStyle()),
                      Text('\$21.75', style: primaryTextStyle()),
                    ],
                  ).paddingOnly(left: 16, right: 16, top: 8),
                  4.height,
                  Divider(),
                  Text('Pickup Date & Time', style: boldTextStyle()).paddingOnly(left: 16, right: 16, top: 8),
                  4.height,
                  Text('Monday, 10 Nov 2017 at 10:00 AM to 12:00 PM', style: secondaryTextStyle()).paddingOnly(left: 16, right: 16),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment Method', style: boldTextStyle()),
                      Text('Cash Delivery', style: primaryTextStyle()),
                    ],
                  ).paddingOnly(left: 16, right: 16, top: 8),
                  16.height,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
