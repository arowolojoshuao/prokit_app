import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBPaymentMethodScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBPickTimeBottomSheet extends StatefulWidget {
  const JCBPickTimeBottomSheet({Key? key}) : super(key: key);

  @override
  State<JCBPickTimeBottomSheet> createState() => _JCBPickTimeBottomSheetState();
}

class _JCBPickTimeBottomSheetState extends State<JCBPickTimeBottomSheet> {
  List<JCBCommonModel> pickList = jcbPickTimeSelection();

  int selectedIndex = 1;

  String selectedHour = '00';
  String selectedMinute = '00';

  List<DateTime> hour = [];
  List<DateTime> minutes = [];

  @override
  void initState() {
    hour = List<DateTime>.generate(10, (i) => DateTime.now().add(Duration(hours: i)));
    minutes = List<DateTime>.generate(60, (i) => DateTime.now().add(Duration(minutes: i)));
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        16.height,
        Text(
          'Pick-up Time',
          style: boldTextStyle(
            size: 26,
            fontFamily: jcbFont,
            color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
            weight: FontWeight.w900,
          ),
        ),
        16.height,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: pickList.map((e) {
            int index = pickList.indexOf(e);
            return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? jcbPrimaryColor.withAlpha(30)
                      : appStore.isDarkModeOn
                          ? context.cardColor
                          : jcbBackGroundColor,
                  borderRadius: radius(jcbButtonRadius),
                  border: Border.all(color: selectedIndex == index ? jcbPrimaryColor : jcbBackGroundColor)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.title.validate(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                      Text(e.subTitle.validate(), style: secondaryTextStyle(color: jcbGreyColor, size: 12)),
                    ],
                  ).expand(),
                  Checkbox(
                    value: selectedIndex == index,
                    onChanged: (bool? value) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    activeColor: jcbPrimaryColor,
                  )
                ],
              ),
            ).paddingSymmetric(vertical: 6).onTap(() {
              selectedIndex = index;
              setState(() {});
            }, borderRadius: radius(jcbButtonRadius));
          }).toList(),
        ),
        16.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${DateFormat('EEE').format(DateTime.now())} ${DateFormat("MMM d").format(DateTime.now())}',
              style: boldTextStyle(),
              textAlign: TextAlign.left,
            ),
            Container(
              height: 90,
              width: 100,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    pickerTextStyle: boldTextStyle(),
                  ),
                ),
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  itemExtent: 25,
                  children: hour.map((e) {
                    return Text(
                      '${e.hour}',
                      style: primaryTextStyle(size: 20),
                      textAlign: TextAlign.left,
                    );
                  }).toList(),
                  onSelectedItemChanged: (int val) {
                    selectedHour = hour[val].hour.toString();
                    setState(() {});
                  },
                ),
              ),
            ),
            Container(
              height: 90,
              width: 100,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    pickerTextStyle: primaryTextStyle(),
                  ),
                ),
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  itemExtent: 25,
                  children: minutes.map((e) {
                    return Text(
                      '${e.minute}',
                      style: primaryTextStyle(size: 20),
                      textAlign: TextAlign.left,
                    );
                  }).toList(),
                  onSelectedItemChanged: (int val) {
                    selectedMinute = minutes[val].minute.toString();
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ).visible(selectedIndex == 1),
        16.height,
        Text(
          selectedIndex == 1 ? 'Driver may arrive by $selectedHour : $selectedMinute' : 'Driver may arrive by 10 minutes',
          style: boldTextStyle(size: 14),
          textAlign: TextAlign.center,
        ).center(),
        16.height,
        AppButton(
          width: context.width() - 32,
          child: Text('set pick-up time'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
          onTap: () {
            finish(context);
            JCBPaymentMethodScreen().launch(context);
          },
          color: jcbPrimaryColor,
          shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
          elevation: 0,
        ),
      ],
    ).paddingAll(16);
  }
}
