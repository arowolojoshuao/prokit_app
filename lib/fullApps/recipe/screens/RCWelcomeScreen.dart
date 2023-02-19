import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCWelcomeImageComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/screens/RCWalkThroughScreen.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RCWelcomeScreen extends StatefulWidget {
  const RCWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<RCWelcomeScreen> createState() => _RCWelcomeScreenState();
}

class _RCWelcomeScreenState extends State<RCWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RCWelcomeImageComponent(),
            100.height,
            Text('Browse 1000+ unique recipes of different cuisines from best chefs', style: secondaryTextStyle(color: rcSecondaryTextColor)).paddingSymmetric(horizontal: 32),
            16.height,
            Container(
                    child: Text('I am new', style: boldTextStyle(size: 18, color: Colors.white)).center(),
                    width: context.width(),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    decoration: BoxDecoration(borderRadius: radius(32), color: primaryColor))
                .onTap(() {
              RCWalkThroughScreen().launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            16.height,
            Container(
                child: Text('I\'ve been here', style: primaryTextStyle(size: 18)).center(),
                width: context.width(),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                margin: EdgeInsets.symmetric(horizontal: 32),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 3),
                  borderRadius: radius(32),
                )).onTap(() {
              RCSignUpScreen(selectedIndex: 1).launch(context);
            }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
            50.height,
          ],
        ),
      ),
    );
  }
}
