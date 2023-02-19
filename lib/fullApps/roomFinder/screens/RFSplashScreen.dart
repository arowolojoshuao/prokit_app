import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFMobileSignInScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';

class RFSplashScreen extends StatefulWidget {
  static String tag = '/room_finder';

  @override
  _RFSplashScreenState createState() => _RFSplashScreenState();
}

class _RFSplashScreenState extends State<RFSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(rf_primaryColor, statusBarIconBrightness: Brightness.light);

    await Future.delayed(Duration(seconds: 2));
    finish(context);
    RFMobileSignIn().launch(context);
  }

  @override
  void dispose() {
    setStatusBarColor(rf_primaryColor, statusBarIconBrightness: Brightness.light);

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rf_primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: rf_splashBgColor),
            width: 250,
            height: 250,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Room Finder", style: boldTextStyle(color: white, size: 20)),
              4.height,
              Text("Ultimate property Finder", style: primaryTextStyle(color: white)),
            ],
          ),
        ],
      ).center(),
    );
  }
}
