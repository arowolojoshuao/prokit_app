import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/medium/screens/MSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/medium/utils/MImages.dart';
import 'package:prokit_flutter/main.dart';

class MSplashScreen extends StatefulWidget {
  static String tag = '/medium';

  @override
  MSplashScreenState createState() => MSplashScreenState();
}

class MSplashScreenState extends State<MSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    checkFirstSeen();
  }

  Future checkFirstSeen() async {
    setStatusBarColor(black);

    await Future.delayed(Duration(seconds: 2));
    finish(context);
    MSignUpScreen().launch(context);
  }

  @override
  void dispose() {
    if (appStore.isDarkModeOn) {
      setStatusBarColor(black);
    } else {
      setStatusBarColor(white);
    }
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(app_ic_medium, height: 90, width: 90, color: white)],
      ).center(),
    );
  }
}
