import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSSchedule/LSCompleteComponent.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSSchedule/LSDateTimeComponent.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSSchedule/LSLocationComponent.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSSchedule/LSPaymentComponent.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';

class LSScheduleScreen extends StatefulWidget {
  static String tag = '/LSScheduleScreen';

  @override
  LSScheduleScreenState createState() => LSScheduleScreenState();
}

class LSScheduleScreenState extends State<LSScheduleScreen> {
  bool isLocation = true;
  bool isDateTime = false;
  bool isPayment = false;
  bool isComplete = false;
  String btnTitle = 'Select Address & Continue'.toUpperCase();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // if (isLocation || isDateTime && !isPayment && !isComplete) {
    //   btnTitle = 'Select Address & Continue'.toUpperCase();
    // }
    // if (!isLocation && !isDateTime && isPayment && !isComplete) {
    //   btnTitle = 'Confirm Order'.toUpperCase();
    // }
    // if (isLocation && !isDateTime && !isPayment && isComplete) {
    //   btnTitle = 'Go to Order status'.toUpperCase();
    // }
    // setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Schedule Pickup',
        elevation: 0.0,
        center: true,
        color: context.cardColor,
        bottom: PreferredSize(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(24)),
                      child: Icon(Icons.pin_drop, color: white),
                    ),
                    Text('Location',
                        style: primaryTextStyle(
                            color: isLocation
                                ? LSColorPrimary
                                : appStore.isDarkModeOn
                                    ? white
                                    : black)),
                  ],
                ).onTap(() {
                  isLocation = true;
                  isDateTime = false;
                  isPayment = false;
                  isComplete = false;
                  btnTitle = 'Select Address & Continue'.toUpperCase();
                  setState(() {});
                }, hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                Container(height: 2, color: lightGrey).expand(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: isDateTime ? LSColorPrimary : grey, borderRadius: BorderRadius.circular(24)),
                      child: Icon(Icons.date_range, color: white),
                    ),
                    Text('DateTime',
                        style: primaryTextStyle(
                            color: isDateTime
                                ? LSColorPrimary
                                : appStore.isDarkModeOn
                                    ? white
                                    : black)),
                  ],
                ).onTap(() {
                  isLocation = true;
                  isDateTime = true;
                  isPayment = false;
                  isComplete = false;
                  btnTitle = 'Select Address & Continue'.toUpperCase();
                  setState(() {});
                }, hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                Container(height: 2, color: lightGrey).expand(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: isPayment ? LSColorPrimary : grey, borderRadius: BorderRadius.circular(24)),
                      child: Icon(Icons.payment, color: white),
                    ),
                    Text('Payment',
                        style: primaryTextStyle(
                            color: isPayment
                                ? LSColorPrimary
                                : appStore.isDarkModeOn
                                    ? white
                                    : black)),
                  ],
                ).onTap(() {
                  isLocation = true;
                  isDateTime = true;
                  isPayment = true;
                  isComplete = false;
                  btnTitle = 'Confirm Order'.toUpperCase();
                  setState(() {});
                }, hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                Container(height: 2, color: lightGrey).expand(),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: isComplete ? LSColorPrimary : grey, borderRadius: BorderRadius.circular(24)),
                      child: Icon(Icons.check, color: white),
                    ),
                    Text('Complete',
                        style: primaryTextStyle(
                            color: isComplete
                                ? LSColorPrimary
                                : appStore.isDarkModeOn
                                    ? white
                                    : black)),
                  ],
                ).onTap(() {
                  isLocation = true;
                  isDateTime = true;
                  isPayment = true;
                  isComplete = true;
                  btnTitle = 'Go to Order status'.toUpperCase();
                  setState(() {});
                }, hoverColor: Colors.transparent, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              ],
            ).paddingAll(16),
            preferredSize: Size(context.width(), 100)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LSLocationComponent().visible(isLocation && !isDateTime && !isPayment && !isComplete),
            LSDateTimeComponent().visible(isLocation && isDateTime && !isPayment && !isComplete),
            LSPaymentComponent().visible(isLocation && isDateTime && isPayment && !isComplete),
            LSCompleteComponent().visible(isLocation && isDateTime && isPayment && isComplete)
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
          width: context.width(),
          color: LSColorPrimary,
          textColor: white,
          text: btnTitle,
          onTap: () {
            if (isLocation && !isDateTime && !isPayment && !isComplete) {
              isDateTime = true;
              btnTitle = 'Select Address & Continue'.toUpperCase();
              setState(() {});
            } else if (isLocation && isDateTime && !isPayment && !isComplete) {
              isPayment = true;
              btnTitle = 'Confirm Order'.toUpperCase();
              setState(() {});
            } else if (isLocation && isDateTime && isPayment && !isComplete) {
              isComplete = true;
              btnTitle = 'Go to Order status'.toUpperCase();
              setState(() {});
            } else {
              toast('Order Successfully');
              finish(context);
              finish(context);
            }
          }).paddingAll(16),
    );
  }
}
