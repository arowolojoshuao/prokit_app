import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShColors.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShConstant.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShStrings.dart';
import 'package:prokit_flutter/fullApps/shopHop/utils/ShWidget.dart';
import 'package:prokit_flutter/main.dart';

class ShSettingsScreen extends StatefulWidget {
  static String tag = '/ShSettingsScreen';

  @override
  ShSettingsScreenState createState() => ShSettingsScreenState();
}

class ShSettingsScreenState extends State<ShSettingsScreen> {
  bool pushNotification = false;
  bool smsNotification = false;
  bool emailNotification = false;
  String? selectedValue = "English(US)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sh_lbl_settings, style: boldTextStyle(size: 18)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : sh_textColorPrimary),
        actionsIconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : sh_colorPrimary),
        actions: [
          cartIcon(context, 3),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_push_notification, style: primaryTextStyle()),
                      Switch(
                        value: pushNotification,
                        onChanged: (value) {
                          setState(() {
                            pushNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  Text(sh_lbl_notification_arrive_on_order_status, style: secondaryTextStyle()),
                  16.height,
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_sms_notification, style: primaryTextStyle()),
                      Switch(
                        value: smsNotification,
                        onChanged: (value) {
                          setState(() {
                            smsNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  Text(sh_contact_phone, style: secondaryTextStyle()),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_email_notification, style: primaryTextStyle()),
                      Switch(
                        value: emailNotification,
                        onChanged: (value) {
                          setState(() {
                            emailNotification = value;
                          });
                        },
                        activeColor: sh_colorPrimary,
                      )
                    ],
                  ),
                  Text(sh_reference_email, style: secondaryTextStyle()),
                  SizedBox(height: spacing_standard_new),
                  divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(sh_lbl_language, style: primaryTextStyle()),
                      DropdownButton<String>(
                        underline: SizedBox(),
                        items: <String>["English(US)", "English(Canada)"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: primaryTextStyle()),
                          );
                        }).toList(),
                        //hint:Text(selectedValue),
                        value: selectedValue,
                        onChanged: (newVal) {
                          setState(() {
                            selectedValue = newVal;
                          });
                        },
                      ),
                    ],
                  ),
                  16.height,
                  divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
