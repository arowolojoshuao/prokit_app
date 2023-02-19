import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMWalkThroughScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/main.dart';

class BMSplashScreen extends StatefulWidget {
  static String tag = '/beauty_master';

  const BMSplashScreen({Key? key}) : super(key: key);

  @override
  _BMSplashScreenState createState() => _BMSplashScreenState();
}

class _BMSplashScreenState extends State<BMSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    await 3.seconds.delay;
    finish(context);
    BMWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/beauty_master/beautymaster_logo.png', height: 200),
          Text('Beauty Master', style: boldTextStyle(size: 20, color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark)),
        ],
      ).center(),
    );
  }
}
