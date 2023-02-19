import 'package:prokit_flutter/fullApps/carea/commons/app_component.dart';
import 'package:prokit_flutter/fullApps/carea/commons/images.dart';
import 'package:prokit_flutter/fullApps/carea/commons/widgets.dart';
import 'package:prokit_flutter/fullApps/carea/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

import 'login_with_pass_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        return true;
      },
      child: Scaffold(
        appBar: careaAppBarWidget(context, titleText: ""),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 16, right: 16, top: 60, bottom: 16),
            color: context.scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(image: AssetImage(car), color: appStore.isDarkModeOn ? white : black, height: 110, width: 110),
                Text(
                  "Let's you in",
                  style: boldTextStyle(size: 30),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPassScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 14, backgroundImage: AssetImage(facebook), backgroundColor: context.cardColor),
                        SizedBox(width: 16),
                        Text('Continue with Facebook', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithPassScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(radius: 12, backgroundImage: AssetImage(google), backgroundColor: context.cardColor),
                        SizedBox(width: 16),
                        Text('Continue with Google', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 14),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithPassScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: commonDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(apple, height: 24, width: 24, color: context.iconColor, fit: BoxFit.cover),
                        SizedBox(width: 16),
                        Text('Continue with Apple', style: boldTextStyle()),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  children: [
                    Expanded(child: Container(height: 0.2, color: appStore.isDarkModeOn ? white : Colors.grey.withOpacity(0.7))),
                    SizedBox(width: 10),
                    Text('Or', style: primaryTextStyle()),
                    SizedBox(width: 10),
                    Expanded(child: Container(height: 0.2, color: appStore.isDarkModeOn ? white : Colors.grey.withOpacity(0.7)))
                  ],
                ),
                SizedBox(height: 28),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithPassScreen()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: CircularBlackDecoration,
                    child: Text('Sign in with password', style: boldTextStyle(color: white)),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: secondaryTextStyle(),
                      children: [
                        TextSpan(text: ' Sign up', style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
