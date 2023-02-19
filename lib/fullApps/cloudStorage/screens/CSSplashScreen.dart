import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/screens/CSStartingScreen.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSConstants.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/utils/CSImages.dart';

class CSSplashScreen extends StatefulWidget {
  static String tag = '/cloud_storage';

  @override
  CSSplashScreenState createState() => CSSplashScreenState();
}

class CSSplashScreenState extends State<CSSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    await Future.delayed(Duration(seconds: 2));
    finish(context);
    CSStartingScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(CSCloudboxLogo, height: 150, width: 150).center(),
          Positioned(
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('From', style: secondaryTextStyle()),
                Text(CSAppName, style: boldTextStyle(size: 25)),
              ],
            ).paddingBottom(16),
          )
        ],
      ),
    );
  }
}
