import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class SDSettingScreen extends StatefulWidget {
  @override
  _SDSettingScreenState createState() => _SDSettingScreenState();
}

class _SDSettingScreenState extends State<SDSettingScreen> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(sdPrimaryColor);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(context.cardColor);

    Widget mOption(var icon, var heading) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: sdIconColor, size: 18),
                16.width,
                Text(heading, style: primaryTextStyle()),
              ],
            ),
            Icon(Icons.keyboard_arrow_right, color: sdIconColor)
          ],
        ),
      );
    }

    Widget mDivider() {
      return Container(color: sdViewColor, height: 1);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          title: Text('Settings', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: <Widget>[
            mOption(Icons.language, "Preferences"),
            mDivider(),
            mOption(Icons.lock_outline, "Privacy and Security"),
            mDivider(),
            mOption(Icons.notifications_none, "Notification Settings"),
            mDivider(),
            mOption(Icons.help_outline, "Help Center"),
            mDivider(),
            mOption(Icons.launch, "Logout"),
          ],
        ),
      ),
    );
  }
}
