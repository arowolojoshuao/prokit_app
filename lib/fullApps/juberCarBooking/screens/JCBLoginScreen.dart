// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFormTextField.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBHomeScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBPhoneNoScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBLoginScreen extends StatelessWidget {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode email = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        actions: [
          Text('Sign Up', style: boldTextStyle(color: jcbPrimaryColor)).center().paddingSymmetric(horizontal: 16).onTap(() {
            finish(context);
            JCBSignUpScreen().launch(context);
          }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Log in', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900)),
            30.height,
            JCBFormTextField(
              autoFocus: false,
              controller: emailCont,
              focus: email,
              nextFocus: password,
              label: 'Email',
              textFieldType: TextFieldType.EMAIL,
            ),
            16.height,
            JCBFormTextField(
              controller: passwordCont,
              focus: password,
              textInputAction: TextInputAction.done,
              label: 'Password',
              textFieldType: TextFieldType.PASSWORD,
            ),
            16.height,
            Text('Forget Password', style: boldTextStyle(color: jcbPrimaryColor, size: 14)).onTap(() {
              JCBPhoneNoScreen().launch(context);
            }, highlightColor: Colors.transparent, splashColor: Colors.transparent),
            80.height,
            AppButton(
              width: context.width() - 32,
              child: Text('Log in'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                JCBHomeScreen().launch(context);
              },
              color: jcbPrimaryColor,
              elevation: 0,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
            ),
            80.height,
            Text('Or connect using social account', style: secondaryTextStyle(color: context.iconColor, size: 12)),
            16.height,
            AppButton(
              padding: EdgeInsets.all(0),
              width: context.width() - 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/juberCarBooking/fb_logo.png', height: 50, width: 50, fit: BoxFit.cover),
                  Text('Connect with Facebook', style: boldTextStyle(color: Colors.white)),
                  SizedBox(width: 5),
                ],
              ),
              onTap: () {},
              color: Color(0xFF4267B2),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ),
            16.height,
            AppButton(
              width: context.width() - 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.call, color: jcbPrimaryColor),
                  Text('Connect with Phone number', style: boldTextStyle(color: jcbPrimaryColor)),
                  SizedBox(width: 5),
                ],
              ),
              onTap: () {},
              color: context.scaffoldBackgroundColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius), side: BorderSide(color: jcbPrimaryColor)),
              elevation: 0,
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
