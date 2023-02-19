import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHEditProfileScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHMemberScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHSettingScreen extends StatefulWidget {
  @override
  SHSettingScreenState createState() => SHSettingScreenState();
}

class SHSettingScreenState extends State<SHSettingScreen> {
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
      body: Stack(
        children: [
          commonSHCachedNetworkImage(
            'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
            fit: BoxFit.fill,
            width: context.width(),
          ),
          Container(width: context.width(), color: Colors.black38),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 40, right: 16),
            child: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.close, color: white, size: 30),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: SHScaffoldDarkColor,
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  settIngContainer(
                    icon: Icons.edit,
                    title: 'Edit Profile',
                    textColor: white,
                    onTap: () {
                      SHEditProfileScreen().launch(
                        context,
                        pageRouteAnimation: PageRouteAnimation.SlideBottomTop,
                      );
                    },
                  ),
                  settIngContainer(
                    icon: Icons.person,
                    title: 'Member',
                    textColor: white,
                    onTap: () {
                      SHMemberScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    },
                  ),
                  settIngContainer(icon: Icons.settings, title: 'Setting', textColor: white),
                  16.height,
                  settIngContainer(icon: Icons.chat, title: 'Terms of use', textColor: white),
                  settIngContainer(icon: Icons.send, title: 'Contact', textColor: white),
                  16.height,
                  settIngContainer(icon: Icons.logout, title: 'SignOut', textColor: Colors.deepOrange),
                  Text(
                    'Version 11',
                    style: secondaryTextStyle(size: 12),
                  ).paddingLeft(16)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
