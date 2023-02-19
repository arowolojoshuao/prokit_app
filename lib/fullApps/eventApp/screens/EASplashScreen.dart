import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import 'EAWalkThroughScreen.dart';

class EASplashScreen extends StatefulWidget {
  static String tag = '/event';

  const EASplashScreen({Key? key}) : super(key: key);

  @override
  _EASplashScreenState createState() => _EASplashScreenState();
}

class _EASplashScreenState extends State<EASplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(transparentColor);
    await 3.seconds.delay;
    finish(context);
    EAWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          commonCachedNetworkImage(
            "$BaseUrl/images/eventApp/logo.png",
            height: 200,
            fit: BoxFit.cover,
            width: context.width(),
          ),
          20.height,
          Text('Event', style: GoogleFonts.acme(fontSize: 40, color: primaryColor1)),
          20.height,
          Text('Event Discovery & Booking App UI Kit', style: primaryTextStyle()),
        ],
      ),
    );
  }
}
