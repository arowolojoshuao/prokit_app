import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIACreatAccountScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MIASetReminderScreen extends StatefulWidget {
  const MIASetReminderScreen({Key? key}) : super(key: key);

  @override
  State<MIASetReminderScreen> createState() => _MIASetReminderScreenState();
}

class _MIASetReminderScreenState extends State<MIASetReminderScreen> {
  bool switchOn = false;

  TimeOfDay? selectedTime = TimeOfDay.now();

  void displayAlertDialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CustomTheme(
              child: CupertinoAlertDialog(
                title: Text(
                  '"Mealime" Would Like to Send You Notifications',
                  style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
                ),
                content: Text(
                  'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
                  style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'Don\'t Allow',
                      style: primaryTextStyle(color: dodgerBlue, size: 18),
                    ),
                    onPressed: () {
                      switchOn = false;
                      setState(() {});
                      finish(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      'Allow',
                      style: primaryTextStyle(color: dodgerBlue, size: 18),
                    ),
                    onPressed: () {
                      finish(context);
                    },
                  )
                ],
              ),
            ));
  }

  selectTimeDialog(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
      builder: (context, child) {
        return Theme(
          data: appStore.isDarkModeOn ? ThemeData.dark().copyWith() : ThemeData.light().copyWith(),
          child: child!,
        );
      },
    );
    if (time != null && time != selectedTime) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Set a weekly reminder', style: boldTextStyle(size: 30)),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remind me to make a meal', style: boldTextStyle()),
                  CupertinoSwitch(
                    value: switchOn,
                    activeColor: miaPrimaryColor,
                    onChanged: (bool val) {
                      switchOn = val;
                      setState(() {});
                      if (val) {
                        displayAlertDialog();
                      }
                    },
                  )
                ],
              ),
              16.height,
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor, borderRadius: radius(miaDefaultRadius)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('At ${selectedTime!.hour} : ${selectedTime!.minute}', style: boldTextStyle()),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ).onTap(() {
                selectTimeDialog(context);
              }),
            ],
          ),
          AppButton(
            color: miaPrimaryColor,
            text: 'Continue',
            textStyle: boldTextStyle(color: white),
            onTap: () {
              MIACreatAccountScreen().launch(context);
            },
          ).center().paddingBottom(20)
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
