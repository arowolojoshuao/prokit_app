import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSCommon.dart';
import 'package:prokit_flutter/main.dart';

class LSDateTimeComponent extends StatefulWidget {
  static String tag = '/LSDateTimeComponent';

  @override
  LSDateTimeComponentState createState() => LSDateTimeComponentState();
}

class LSDateTimeComponentState extends State<LSDateTimeComponent> {
  TextEditingController pickUpDateCont = TextEditingController();
  TextEditingController pickUpTimeCont = TextEditingController();
  TextEditingController deliveryDateCont = TextEditingController();
  TextEditingController deliveryTimeCont = TextEditingController();

  DateTime pickUpDate = DateTime.now();
  TimeOfDay pickUpTime = TimeOfDay.now();
  DateTime deliveryDate = DateTime.now();
  TimeOfDay deliveryTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.height(),
        width: context.width(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Pickup Date & Time', style: boldTextStyle()),
            16.height,
            Container(
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                children: [
                  16.height,
                  Theme(
                    data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
                    child: DateTimePicker(
                      dateMask: 'yyyy-MM-dd',
                      type: DateTimePickerType.date,
                      controller: pickUpDateCont,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      style: primaryTextStyle(),
                      initialDate: pickUpDate,
                      firstDate: pickUpDate,
                      lastDate: DateTime(DateTime.now().year + 1),
                      use24HourFormat: true,
                      locale: Locale('en', 'US'),
                      useRootNavigator: true,
                      decoration: inputDecoration(context, hint: 'Select Date', suffixIcon: Icon(Icons.date_range)),
                      onChanged: (val) {
                        //
                      },
                      validator: (val) {
                        //
                      },
                      onSaved: (val) {
                        //
                      },
                    ),
                  ).paddingOnly(top: 16, bottom: 8, left: 16, right: 16),
                  Theme(
                    data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
                    child: DateTimePicker(
                      controller: pickUpTimeCont,
                      dateMask: 'hh:mm:ss a',
                      type: DateTimePickerType.time,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      style: primaryTextStyle(),
                      use24HourFormat: true,
                      locale: Locale('en', 'US'),
                      useRootNavigator: true,
                      decoration: inputDecoration(context, hint: 'Select Time', suffixIcon: Icon(Icons.arrow_drop_down)),
                      onChanged: (val) {
                        //
                      },
                      validator: (val) {
                        //
                      },
                      onSaved: (val) {
                        //
                      },
                    ),
                  ).paddingOnly(top: 16, bottom: 8, left: 16, right: 16),
                  16.height,
                ],
              ),
            ),
            16.height,
            Text('Delivery Date & Time', style: boldTextStyle()),
            16.height,
            Container(
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                children: [
                  16.height,
                  Theme(
                    data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
                    child: DateTimePicker(
                      dateMask: 'yyyy-MM-dd',
                      type: DateTimePickerType.date,
                      controller: deliveryDateCont,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      style: primaryTextStyle(),
                      initialDate: pickUpDate,
                      firstDate: pickUpDate,
                      lastDate: DateTime(DateTime.now().year + 1),
                      use24HourFormat: true,
                      locale: Locale('en', 'US'),
                      useRootNavigator: true,
                      decoration: inputDecoration(context, hint: 'Select Date', suffixIcon: Icon(Icons.date_range)),
                      onChanged: (val) {
                        //
                      },
                      validator: (val) {
                        //
                      },
                      onSaved: (val) {
                        //
                      },
                    ),
                  ).paddingOnly(top: 16, bottom: 8, left: 16, right: 16),
                  Theme(
                    data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
                    child: DateTimePicker(
                      controller: deliveryTimeCont,
                      dateMask: 'hh:mm:ss a',
                      type: DateTimePickerType.time,
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      style: primaryTextStyle(),
                      use24HourFormat: true,
                      locale: Locale('en', 'US'),
                      useRootNavigator: true,
                      decoration: inputDecoration(context, hint: 'Select Time', suffixIcon: Icon(Icons.arrow_drop_down)),
                      onChanged: (val) {
                        //
                      },
                      validator: (val) {
                        //
                      },
                      onSaved: (val) {
                        //
                      },
                    ),
                  ).paddingOnly(top: 16, bottom: 8, left: 16, right: 16),
                  16.height,
                ],
              ),
            ),
          ],
        ).paddingAll(8),
      ),
    );
  }
}
