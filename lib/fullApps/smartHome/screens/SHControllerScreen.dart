import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSignInScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class SHControllerScreen extends StatefulWidget {
  @override
  SHControllerScreenState createState() => SHControllerScreenState();
}

class SHControllerScreenState extends State<SHControllerScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              commonSHCachedNetworkImage(
                'https://cdn.pixabay.com/photo/2015/11/04/10/38/hotel-1022297_960_720.jpg',
                fit: BoxFit.cover,
                height: context.height(),
                width: context.width(),
              ),
              Container(
                width: context.width(),
                height: context.height(),
                color: Colors.black26,
              ),
              Column(
                children: [
                  Text('Control your home', style: boldTextStyle(color: white, size: 30)),
                  16.height,
                  Text('Control all your smart home devices\nand enjoy your life', style: primaryTextStyle(color: white), textAlign: TextAlign.center),
                  16.height,
                  button(
                    textColor: white,
                    width: context.width(),
                    context: context,
                    text: 'Get Started',
                    onTap: () {
                      SHSigUPScreen().launch(context);
                    },
                  ),
                  16.height,
                  AppButton(
                    color: context.cardColor,
                    text: 'Sign In',
                    textStyle: boldTextStyle(),
                    width: context.width(),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    onTap: () {
                      SHSignInScreen().launch(context);
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 16, horizontal: 16)
            ],
          ),
        ],
      ),
    );
  }
}
