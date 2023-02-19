import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSCompleteProfileOneScreen.dart';
import 'package:prokit_flutter/fullApps/jobSearch/screens/JSEnableNotificationDialog.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSImage.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSWidget.dart';
import 'package:prokit_flutter/main.dart';

class JSMessagesScreen extends StatefulWidget {
  const JSMessagesScreen({Key? key}) : super(key: key);

  @override
  _JSMessagesScreenState createState() => _JSMessagesScreenState();
}

class _JSMessagesScreenState extends State<JSMessagesScreen> {
  var toYearItems = ['Inbox', 'Archive', 'Spam'];

  String toYearValue = 'Inbox';

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: jsAppBar(context, backWidget: true, homeAction: true, bottomSheet: false),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: boxDecorationWithRoundedCorners(boxShadow: [
              BoxShadow(
                spreadRadius: 0.6,
                blurRadius: 1,
                color: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.5),
              ),
            ], borderRadius: BorderRadius.circular(0), backgroundColor: context.scaffoldBackgroundColor),
            padding: EdgeInsets.only(bottom: 16, top: 16),
            child: Container(
              decoration: boxDecorationWithRoundedCorners(
                border: Border.all(color: gray.withOpacity(0.4)),
                backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton(
                isExpanded: true,
                underline: Container(color: Colors.transparent),
                value: toYearValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: toYearItems.map((String toYearItems) {
                  return DropdownMenuItem(
                    value: toYearItems,
                    child: Text(toYearItems),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    toYearValue = newValue!;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: context.scaffoldBackgroundColor,
                          insetPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          child: JSEnableNotificationDialog(),
                        );
                      },
                    );
                  });
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                commonCachedNetworkImage(js_message, fit: BoxFit.cover, height: 150),
                16.height,
                Text("Welcome to Messages", style: boldTextStyle(size: 22)),
                8.height,
                Text(
                  "When an employer contact you, you will see message here.",
                  style: primaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                16.height,
                AppButton(
                  color: js_primaryColor,
                  width: context.width(),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: Text("${"Indeed Jobs"} Would Like to Send You Notification"),
                              content: Text("Notification may include alerts, sound and icon badges. These can configured in Settings. "),
                              actions: [
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  child: Text("Don't Allow"),
                                  onPressed: () {
                                    finish(context);
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("Allow"),
                                  onPressed: () {
                                    finish(context);
                                  },
                                )
                              ],
                            ));
                  },
                  child: Text("Find jobs", style: boldTextStyle(color: white)),
                ),
                8.height,
                Container(
                  width: context.width(),
                  child: OutlinedButton(
                    child: Text("Upload your CV", style: boldTextStyle(color: js_primaryColor)).paddingSymmetric(vertical: 12),
                    onPressed: () {
                      JSCompleteProfileOneScreen().launch(context);
                    },
                  ),
                )
              ],
            ).paddingOnly(left: 40, right: 40, top: context.height() * 0.12),
          ),
        ],
      ),
    );
  }
}
