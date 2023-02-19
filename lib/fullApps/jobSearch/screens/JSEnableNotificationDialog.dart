import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSColors.dart';
import 'package:prokit_flutter/fullApps/jobSearch/utils/JSImage.dart';
import 'package:prokit_flutter/main.dart';

class JSEnableNotificationDialog extends StatefulWidget {
  const JSEnableNotificationDialog({Key? key}) : super(key: key);

  @override
  _JSEnableNotificationDialogState createState() => _JSEnableNotificationDialogState();
}

class _JSEnableNotificationDialogState extends State<JSEnableNotificationDialog> {
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
    return Container(
      width: context.width() * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            js_enable_notification,
            fit: BoxFit.cover,
            height: 90,
            color: appStore.isDarkModeOn ? white : js_primaryColor,
          ),
          16.height,
          Text("Get Job Updates", style: boldTextStyle(size: 22)),
          8.height,
          Text(
            "Indeed Jobs send push notification to:",
            style: primaryTextStyle(),
            textAlign: TextAlign.center,
          ),
          16.height,
          Container(height: 2, color: gray),
          16.height,
          UL(
            children: [
              Text("Keep you up to date with the latest jobs.", style: primaryTextStyle()),
              Text("Update you about job you've applied to.", style: primaryTextStyle()),
              Text("Let you know when you've got a new message from an employer.", style: primaryTextStyle())
            ],
          ),
          16.height,
          AppButton(
            color: js_primaryColor,
            width: context.width(),
            onTap: () {
              finish(context);
              snackBar(context, title: 'Enable push notifications');
            },
            child: Text("Enable push notifications", style: boldTextStyle(color: white)),
          ),
          8.height,
          Container(
            width: context.width(),
            child: OutlinedButton(
              child: Text("Skip for now", style: boldTextStyle(color: js_primaryColor)).paddingSymmetric(vertical: 12),
              onPressed: () {
                finish(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
