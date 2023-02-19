import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'SHControllerScreen.dart';

class SHSplashScreen extends StatefulWidget {
  static String tag = '/smart_home';

  @override
  SHSplashScreenState createState() => SHSplashScreenState();
}

class SHSplashScreenState extends State<SHSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(
      Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );

    await Future.delayed(Duration(seconds: 3));
    finish(context);
    SHControllerScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.red,
              Colors.blue,
            ],
          ),
        ),
        child: Text(
          'Smart Home',
          style: boldTextStyle(
            color: white,
            size: 50,
            fontFamily: GoogleFonts.roboto().fontFamily,
          ),
        ).center(),
      ),
    );
  }
}
