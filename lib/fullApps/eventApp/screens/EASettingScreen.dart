import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

class EASettingScreen extends StatefulWidget {
  const EASettingScreen({Key? key}) : super(key: key);

  @override
  _EASettingScreenState createState() => _EASettingScreenState();
}

class _EASettingScreenState extends State<EASettingScreen> {
  bool isNotificationOn = false;
  bool isLocationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Setting",
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back, color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingItemWidget(
              title: "Change Email",
              leading: Icon(LineIcons.envelope, size: 30),
              subTitle: "abc@gmail.com",
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: grey.withOpacity(0.3)),
            ),
            SettingItemWidget(
              title: "Change City",
              leading: Icon(LineIcons.city, size: 30),
              subTitle: "London",
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: grey.withOpacity(0.3)),
            ),
            SettingItemWidget(
              title: "Change Hashtag",
              leading: Icon(LineIcons.hashtag, size: 30),
              subTitle: "8 hashtag",
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: grey.withOpacity(0.3)),
            ),
            SettingItemWidget(
                title: "Delete Payment history",
                leading: Icon(
                  LineIcons.credit_card,
                  size: 30,
                )),
            SettingItemWidget(
              title: "Enable Notification",
              leading: Icon(LineIcons.bell, size: 30),
              trailing: CupertinoSwitch(
                value: isNotificationOn,
                onChanged: (bool val) {
                  isNotificationOn = val;
                  setState(() {});
                },
              ).withHeight(0.5),
            ),
            SettingItemWidget(
                title: "Turn on Location",
                leading: Icon(LineIcons.map_marker, size: 30),
                trailing: CupertinoSwitch(
                  value: isLocationOn,
                  onChanged: (bool val) {
                    isLocationOn = val;
                    setState(() {});
                  },
                ).withHeight(0.5)),
            30.height,
            Text('About US'.toUpperCase(), style: boldTextStyle(color: grey.withOpacity(0.3))).paddingLeft(16),
            16.height,
            SettingItemWidget(
              title: "About us",
              leading: Icon(LineIcons.alternate_comment_1, size: 30),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: grey.withOpacity(0.3)),
            ),
            SettingItemWidget(
              title: "Send Feedback",
              leading: Icon(LineIcons.info_circle, size: 30),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: grey.withOpacity(0.3)),
            ),
            SettingItemWidget(
              title: "Check For Update",
              leading: Icon(LineIcons.alternate_cloud_download, size: 30),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Text('Version 2.0', style: boldTextStyle(), textAlign: TextAlign.center).paddingBottom(16),
    );
  }
}
