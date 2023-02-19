import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCWelcomeScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';

class RCSplashScreen extends StatefulWidget {
  static String tag = '/recipe';

  const RCSplashScreen({Key? key}) : super(key: key);

  @override
  _RCSplashScreenState createState() => _RCSplashScreenState();
}

class _RCSplashScreenState extends State<RCSplashScreen> {
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
    RCWelcomeScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -110,
            right: -60,
            child: Icon(Icons.cloud, color: Colors.white.withOpacity(0.2), size: 350),
          ),
          Positioned(
            right: 0,
            child: Container(
              height: 300,
              width: 250,
              decoration: BoxDecoration(borderRadius: radius(16), color: Colors.white.withOpacity(0.2)),
              transform: Matrix4.rotationZ(6),
            ),
          ),
          Positioned(
            top: 200,
            left: -100,
            child: Image.asset('images/recipe/fork.png', height: 350, color: Colors.white.withOpacity(0.2)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: Text('K', style: boldTextStyle(size: 68, color: Colors.white, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
              ),
              Text('ifot', style: boldTextStyle(size: 50, color: Colors.white, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
              RotatedBox(
                quarterTurns: 2,
                child: Text('A', style: boldTextStyle(size: 68, color: Colors.white, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
              ),
            ],
          ).center(),
        ],
      ),
      backgroundColor: primaryColor,
    );
  }
}
