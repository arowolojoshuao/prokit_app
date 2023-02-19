import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBLoginScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';

class JCBWelcomeScreen extends StatelessWidget {
  const JCBWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: SizedBox(
        height: context.height(),
        child: Stack(
          children: [
            Positioned(
              bottom: context.height() * 0.15,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: context.statusBarHeight + 50),
                    Image.asset('images/juberCarBooking/juber_app_icon.png', height: 100, width: 100, fit: BoxFit.cover),
                    Text('JUBER', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: jcbDarkColor, weight: FontWeight.w900)),
                    Image.asset(
                      'images/juberCarBooking/jcb_welcom_image.png',
                      width: context.width(),
                      height: context.height() * 0.6,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: context.height() * 0.15,
                color: jcbImageColor,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: context.width() / 2 - 24,
                      decoration: BoxDecoration(borderRadius: radius(jcbButtonRadius), color: Colors.white),
                      child: Text('Sign up', style: boldTextStyle(color: jcbPrimaryColor, size: 20), textAlign: TextAlign.center),
                    ).onTap(() {
                      JCBSignUpScreen().launch(context);
                    }),
                    Container(
                      margin: EdgeInsets.only(right: 16, top: 20, bottom: 20),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: context.width() / 2 - 24,
                      decoration: BoxDecoration(
                        borderRadius: radius(jcbButtonRadius),
                        color: jcbImageColor,
                        border: Border.all(color: Colors.white),
                      ),
                      child: Text('Log in', style: boldTextStyle(color: Colors.white, size: 20), textAlign: TextAlign.center),
                    ).onTap(() {
                      JCBLoginScreen().launch(context);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
