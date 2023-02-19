import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBHomeScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';

class JCBGetStartedScreen extends StatelessWidget {
  const JCBGetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbSecBackGroundColor,
      body: SizedBox(
        height: context.height(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: context.statusBarHeight + 40),
                Image.asset(
                  'images/juberCarBooking/jcbIcons/ic_tick.png',
                  color: jcbDarkColor,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                30.height,
                Text(
                  'You are ready to go!',
                  style: boldTextStyle(size: 34, fontFamily: jcbFont, color: jcbDarkColor, weight: FontWeight.w900),
                  textAlign: TextAlign.center,
                ),
                20.height,
                Text(
                  'Thanks for taking your time to create \naccount with us. Now this is the fun part, \nlet\'s explore the app.',
                  style: primaryTextStyle(color: jcbDarkColor, weight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                40.height,
              ],
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'images/juberCarBooking/jcb_welcom_image.png',
                width: context.width(),
                fit: BoxFit.cover,
              ),
            ),
            AppButton(
              width: context.width() - 60,
              child: Text('Get started'.toUpperCase(), style: boldTextStyle(color: jcbPrimaryColor)),
              onTap: () {
                JCBHomeScreen().launch(context);
              },
              color: jcbDarkColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ).center(),
          ],
        ),
      ),
    );
  }
}
