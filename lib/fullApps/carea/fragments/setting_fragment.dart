import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/login_with_pass_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/notification_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/payment_screen.dart';
import 'package:prokit_flutter/fullApps/carea/screens/profile_screen.dart';
import 'package:prokit_flutter/main.dart';

class SettingFragment extends StatefulWidget {
  @override
  _SettingFragmentState createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
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
      appBar: careaAppBarWidget(
        context,
        titleText: "Profile",
        actionWidget: IconButton(onPressed: () {}, icon: Icon(Icons.chat, color: context.iconColor)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            Stack(
              children: [
                Image.asset("images/carea/userImage.jpg", height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.edit, color: white, size: 16),
                  ).onTap(() {
                    ProfileScreen().launch(context);
                  }),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Andrew Desuza', style: boldTextStyle(size: 18)),
            SizedBox(height: 8),
            Text('+1 111 455 654 321', style: secondaryTextStyle()),
            SizedBox(height: 16),
            Divider(height: 0),
            SizedBox(height: 16),
            SettingItemWidget(
              leading: Icon(Icons.person_outline, color: context.iconColor),
              title: "Edit Profile",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                ProfileScreen().launch(context);
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.location_on_outlined, color: context.iconColor),
              title: "Address",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                //
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.notifications_active_outlined, color: context.iconColor),
              title: "Notification",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                NotificationScreen().launch(context);
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.payment_rounded, color: context.iconColor),
              title: "Payment",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                PaymentScreen().launch(context);
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.security, color: context.iconColor),
              title: "Security",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                //
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.wb_sunny_outlined, color: context.iconColor),
              title: "Dark Mode",
              titleTextStyle: boldTextStyle(),
              onTap: () async {
                if (appStore.isDarkModeOn) {
                  appStore.toggleDarkMode(value: false);
                } else {
                  appStore.toggleDarkMode(value: true);
                }
              },
              trailing: SizedBox(
                height: 20,
                width: 30,
                child: Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: appStore.isDarkModeOn,
                  onChanged: (bool value) {
                    appStore.toggleDarkMode(value: value);
                    setState(() {});
                  },
                ),
              ),
            ),
            SettingItemWidget(
              leading: Icon(Icons.lock_outline, color: context.iconColor),
              title: "Privacy Policy",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                //
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.help_center_outlined, color: context.iconColor),
              title: "Help Support",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                //
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.group_outlined, color: context.iconColor),
              title: "Invite Friends",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                //
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
            SettingItemWidget(
              leading: Icon(Icons.login, color: context.iconColor),
              title: "Logout",
              titleTextStyle: boldTextStyle(),
              onTap: () {
                showConfirmDialogCustom(context, onAccept: (c) {
                  LoginWithPassScreen().launch(context);
                }, dialogType: DialogType.CONFIRMATION);
              },
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18, color: context.iconColor),
            ),
          ],
        ),
      ),
    );
  }
}
