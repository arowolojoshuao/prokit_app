import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/hairSalon/screens/BHWalkThroughScreen.dart';
import 'package:prokit_flutter/main.dart';

class BHSplashScreen extends StatefulWidget {
  static String tag = '/hair_salon';

  @override
  BHSplashScreenState createState() => BHSplashScreenState();
}

class BHSplashScreenState extends State<BHSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Timer(Duration(seconds: 5), () {
      finish(context);
      BHWalkThroughScreen().launch(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'images/hairSalon/bh_logo.svg',
          height: 250,
          width: 250,
          color: appStore.isDarkModeOn ? white : Colors.black.withOpacity(0.7),
        ),
      ),
    );
  }
}
