import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/evSpot/components/dotted_line.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/privacy_policy_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/sign_in_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/terms_condition_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String languageGroupValue = 'English';
  String appModeGroupValue = 'Light Mode';
  String distanceGroupValue = 'Km (Kilometer)';

  List<String> languageListItem = ['English', 'Hindi', 'Arabic', 'Francais', 'Italian', 'Gujarati', 'Portugues', 'Turk'];
  List<String> appModeListItem = ['Light Mode', 'Dark Mode'];
  List<String> distanceListItem = ['Km (Kilometer)', 'Miles', 'Mm (Milimeters)', 'Cm (Centimeters)', 'M (Meters)'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Settings', style: boldTextStyle(size: 22)),
                  SizedBox(height: 6),
                  Text('Set your preferences', style: secondaryTextStyle(size: 16)),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      languageGroupValue = await showDialog(
                        context: context,
                        builder: (context) => dialog(context: context, titleDialog: 'Select Language', listItemValue: languageListItem, groupValue: languageGroupValue),
                      );
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Select Language', style: secondaryTextStyle(size: 16)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('$languageGroupValue', style: primaryTextStyle())),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Observer(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          appModeGroupValue = appStore.isDarkModeOn ? "Dark Mode" : "Light Mode";
                          showDialog(
                            context: context,
                            builder: (context) => dialog(context: context, titleDialog: 'App Mode', listItemValue: appModeListItem, groupValue: appModeGroupValue),
                          ).then((value) {
                            if (value != null && value == 'Dark Mode') {
                              appStore.toggleDarkMode(value: true);
                            } else {
                              appStore.toggleDarkMode(value: false);
                            }
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('App Mode', style: secondaryTextStyle(size: 16)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: Text('${appStore.isDarkModeOn ? 'Dark Mode' : 'Light Mode'}', style: primaryTextStyle())),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      distanceGroupValue = await showDialog(
                        context: context,
                        builder: (context) => dialog(context: context, titleDialog: 'Distance Unity', listItemValue: distanceListItem, groupValue: distanceGroupValue),
                      );
                      setState(() {});
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Distance Unity', style: secondaryTextStyle(size: 16)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('$distanceGroupValue', style: primaryTextStyle())),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DottedLine(lineThickness: 2, dashLength: 4, dashColor: appStore.isDarkModeOn ? dividerBlackColor : dividerColor),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SettingItemWidget(
                  title: 'Terms & Conditions',
                  titleTextStyle: primaryTextStyle(),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionScreen()));
                  },
                ),
                SettingItemWidget(
                  title: 'Privacy Policy',
                  titleTextStyle: primaryTextStyle(),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                  },
                ),
                SettingItemWidget(
                  title: 'Logout',
                  titleTextStyle: primaryTextStyle(),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Do you really want to logout the account ?'),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          actions: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('CANCEL', style: primaryTextStyle(color: ev_primary_color)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: TextButton(
                                      onPressed: () {
                                        /// It is used, when user wants to navigate page before all page removes from stack
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                      },
                                      child: Text('LOGOUT', style: primaryTextStyle(color: Colors.white)),
                                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ev_primary_color)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dialog({required BuildContext context, String? titleDialog, required List<String> listItemValue, required String groupValue}) {
    return StatefulBuilder(
      builder: (ctx, setState) => SimpleDialog(
        title: Text('$titleDialog'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: EdgeInsets.all(0),
        titlePadding: EdgeInsets.all(16),
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 200, minHeight: 100),
            width: 200,
            child: ListView.builder(
              itemCount: listItemValue.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile<String>(
                  title: Text(
                    listItemValue[index].toString(),
                    style: primaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : textPrimaryLightColor),
                  ),
                  value: listItemValue[index],
                  groupValue: groupValue,
                  activeColor: ev_primary_color,
                  visualDensity: VisualDensity.compact,
                  onChanged: (String? value) {
                    setState(() {
                      groupValue = value!;
                    });
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(DEFAULT_RADIUS))),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(DEFAULT_RADIUS)))),
                    ),
                    child: Text('DISMISS', style: primaryTextStyle(color: ev_primary_color)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              SizedBox(width: 1),
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(color: ev_primary_color, borderRadius: BorderRadius.only(bottomRight: Radius.circular(DEFAULT_RADIUS))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, groupValue);
                    },
                    child: Text('OKAY', style: primaryTextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
