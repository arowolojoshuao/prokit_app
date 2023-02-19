import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFCommonAppComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFConformationDialog.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFHomeScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFResetPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFSignUpScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFString.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';

// ignore: must_be_immutable
class RFEmailSignInScreen extends StatefulWidget {
  bool showDialog;

  RFEmailSignInScreen({this.showDialog = false});

  @override
  _RFEmailSignInScreenState createState() => _RFEmailSignInScreenState();
}

class _RFEmailSignInScreenState extends State<RFEmailSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(rf_primaryColor, statusBarIconBrightness: Brightness.light);

    widget.showDialog
        ? Timer.run(() {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (_) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.of(context).pop(true);
                });
                return Material(type: MaterialType.transparency, child: RFConformationDialog());
              },
            );
          })
        : SizedBox();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RFCommonAppComponent(
        title: RFAppName,
        subTitle: RFAppSubTitle,
        mainWidgetHeight: 230,
        subWidgetHeight: 170,
        cardWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sign In to Continue', style: boldTextStyle(size: 18)),
            16.height,
            AppTextField(
              controller: emailController,
              focus: emailFocusNode,
              nextFocus: passWordFocusNode,
              textFieldType: TextFieldType.EMAIL,
              decoration: rfInputDecoration(
                lableText: "Email Address",
                showLableText: true,
                suffixIcon: Container(
                  padding: EdgeInsets.all(2),
                  decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: rf_rattingBgColor),
                  child: Icon(Icons.done, color: Colors.white, size: 14),
                ),
              ),
            ),
            16.height,
            AppTextField(
              controller: passwordController,
              focus: passWordFocusNode,
              textFieldType: TextFieldType.PASSWORD,
              decoration: rfInputDecoration(
                lableText: 'Password',
                showLableText: true,
              ),
            ),
            32.height,
            AppButton(
              color: rf_primaryColor,
              child: Text('Log In', style: boldTextStyle(color: white)),
              width: context.width(),
              elevation: 0,
              onTap: () {
                RFHomeScreen().launch(context);
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  child: Text("Reset Password?", style: primaryTextStyle()),
                  onPressed: () {
                    RFResetPasswordScreen().launch(context);
                  }),
            ),
          ],
        ),
        subWidget: socialLoginWidget(context, title1: "New Member? ", title2: "Sign up Here", callBack: () {
          RFSignUpScreen().launch(context);
        }),
      ),
    );
  }
}
