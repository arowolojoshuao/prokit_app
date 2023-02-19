import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/signup_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

import 'signin_with _email_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, title: "", showLeadingIcon: false),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account? ', style: primaryTextStyle()),
          Text('Sign Up', style: boldTextStyle(color: Colors.green.withOpacity(0.4))).onTap(() {
            SignUpScreen().launch(context);
          }),
        ],
      ).paddingOnly(bottom: 24),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            24.height,
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: boxDecorationWithShadow(boxShape: BoxShape.circle, backgroundColor: greenColor),
                  width: 350,
                  height: 350,
                ),
                CommonCachedNetworkImage(
                  walkThrough3,
                  fit: BoxFit.cover,
                  width: context.width() * 0.8,
                  radius: 16,
                ),
              ],
            ),
            60.height,
            Text('Welcome to Invester', style: boldTextStyle(size: 26)),
            24.height,
            Text(
              'We let you invest in fraction of stocks \nwith as little as \$1.',
              textAlign: TextAlign.center,
              style: secondaryTextStyle(height: 1.4),
            ),
            32.height,
            CommonButton(
                buttonText: "Sign In with Email",
                width: context.width(),
                onTap: () {
                  SignWithEmailInScreen().launch(context);
                }),
            16.height,
            SizedBox(
              height: 45,
              child: OutlinedButton(
                onPressed: () {
                  //
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonCachedNetworkImage(apple_logo, fit: BoxFit.cover, width: 20, height: 20),
                    8.width,
                    Text("Sign in with Apple", style: boldTextStyle()),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.1)),
                ),
              ),
            ),
            16.height,
            SizedBox(
              height: 45,
              child: OutlinedButton(
                onPressed: () {
                  //
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonCachedNetworkImage(google_logo, fit: BoxFit.cover, width: 20, height: 20),
                    8.width,
                    Text("Sign in with Google", style: boldTextStyle()),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.1)),
                ),
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
