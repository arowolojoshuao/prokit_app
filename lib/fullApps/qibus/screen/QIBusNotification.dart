import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/qibus/model/QiBusModel.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusColors.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusConstant.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusDataGenerator.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusStrings.dart';
import 'package:prokit_flutter/fullApps/qibus/utils/QiBusWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QIBusNotification extends StatefulWidget {
  static String tag = '/QIBusNotification';

  @override
  QIBusNotificationState createState() => QIBusNotificationState();
}

class QIBusNotificationState extends State<QIBusNotification> {
  late List<QIBusBookingModel> mList;

  @override
  void initState() {
    super.initState();
    mList = QIBusGetNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    backgroundColor: qIBus_app_background,
      body: SafeArea(
        child: Column(
          children: [
            title(QIBus_lbl_notification, context),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Notification(mList[index], index);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Notification extends StatelessWidget {
  late QIBusBookingModel model;

  Notification(QIBusBookingModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      decoration: boxDecoration(
        showShadow: true,
        radius: spacing_middle,
      ),
      padding: EdgeInsets.all(spacing_middle),
      margin: EdgeInsets.only(bottom: spacing_standard_new, right: spacing_standard_new, left: spacing_standard_new),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: w * 0.2,
            height: w * 0.2,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: qIBus_colorPrimary, width: spacing_control_half)),
            child: Center(child: Text("28 May", style: boldTextStyle(size: 14))),
          ),
          16.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(model.destination, fontFamily: fontMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
//                  text(
//                    model.passengerName,
//                    textColor: qIBus_textChild,
//                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: model.totalFare, style: TextStyle(fontSize: textSizeMedium, color: qIBus_color_check)),
                        WidgetSpan(
                          child: Icon(Icons.check_circle, color: qIBus_color_check, size: 16).paddingOnly(left: spacing_standard),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
