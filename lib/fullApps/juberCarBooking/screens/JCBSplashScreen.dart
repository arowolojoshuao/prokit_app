import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBWalkThroughScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';

class JCBSplashScreen extends StatefulWidget {
  static String tag = '/juber_car';
  const JCBSplashScreen({Key? key}) : super(key: key);

  @override
  State<JCBSplashScreen> createState() => _JCBSplashScreenState();
}

class _JCBSplashScreenState extends State<JCBSplashScreen> {
  @override
  void initState() {
    super.initState();
    //
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 3.seconds.delay;
    finish(context);
    JCBWalkThroughScreen().launch(context);
    // JCBWelcomeScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: context.statusBarHeight + 50),
                Image.asset('images/juberCarBooking/juber_app_icon.png', height: 100, width: 100, fit: BoxFit.cover),
                Text('JUBER', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: jcbDarkColor, weight: FontWeight.w900)),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Image.asset('images/juberCarBooking/jcb_splash_background_image.png', width: context.width(), fit: BoxFit.cover),
            ),
            Image.asset('images/juberCarBooking/jcbGifs/jcb_loader.gif', color: jcbDarkColor, width: 50, height: 50),
          ],
        ),
      ),
    );
  }
}
