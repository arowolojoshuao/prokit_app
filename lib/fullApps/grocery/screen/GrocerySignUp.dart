import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddNumber.dart';
import 'GroceryDashboard.dart';
import 'GroceryForgotPassword.dart';

// ignore: must_be_immutable
class GrocerySignUp extends StatefulWidget {
  static String tag = '/GrocerySignUp';
  bool? isSignIn;
  bool? isSignUp;

  GrocerySignUp({this.isSignIn, this.isSignUp});

  @override
  _GrocerySignUpState createState() => _GrocerySignUpState();
}

class _GrocerySignUpState extends State<GrocerySignUp> {
  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  Widget build(BuildContext context) {
    final signIn = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            grocery_lbl_sigIn_App,
            fontSize: textSizeLarge,
            fontFamily: fontBold,
          ).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
          text(
            grocery_lbl_Enter_email_password_to_continue,
            textColor: grocery_textColorSecondary,
            fontSize: textSizeLargeMedium,
          ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
          EditText(
            text: grocery_lbl_Email_Address,
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          EditText(
            text: grocery_lbl_Password,
            isPassword: true,
          ).paddingAll(spacing_standard_new),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(
                "$grocery_lbl_Forgot_password?",
                fontSize: textSizeLargeMedium,
                fontFamily: fontMedium,
              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new, bottom: spacing_standard_new).onTap(() {
                GroceryForgotPassword().launch(context);
              }),
              groceryButton(
                textContent: grocery_lbl_Sign_In,
                onPressed: (() {
                  GroceryDashBoardScreen().launch(context);
                }),
              ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new).paddingOnly(
                    top: spacing_standard_new,
                    bottom: spacing_standard_new,
                  )
            ],
          )
        ],
      ),
    );

    final signUp = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(grocery_lbl_Welcome_app, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(
            top: spacing_standard_new,
            left: spacing_standard_new,
            right: spacing_standard_new,
          ),
          text(
            grocery_lbl_let_Started,
            textColor: grocery_textColorSecondary,
            fontSize: textSizeLargeMedium,
            fontFamily: fontRegular,
          ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
          EditText(text: grocery_lbl_UserName, isPassword: false).paddingAll(spacing_standard_new),
          EditText(
            text: grocery_lbl_Email_Address,
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          EditText(text: grocery_lbl_Password, isPassword: true).paddingAll(spacing_standard_new),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: groceryButton(
                textContent: grocery_lbl_Next,
                onPressed: (() {
                  GroceryAddNumber().launch(context);
                }),
              ).paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
            ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
          )
        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: context.width(),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
                  boxShadow: defaultBoxShadow(),
                  backgroundColor: context.cardColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text("Sign In",
                                textColor: widget.isSignIn == true
                                    ? grocery_textGreenColor
                                    : appStore.isDarkModeOn
                                        ? white.withOpacity(0.3)
                                        : grocery_textColorPrimary,
                                fontSize: textSizeLargeMedium,
                                fontFamily: fontBold)
                            .paddingAll(spacing_standard_new)
                            .onTap(() {
                          widget.isSignIn = true;
                          widget.isSignUp = false;
                          setState(() {});
                        }),
                        text(
                          "Sign Up",
                          textColor: widget.isSignUp == true ? grocery_textGreenColor : grocery_textColorPrimary,
                          fontSize: textSizeLargeMedium,
                          fontFamily: fontBold,
                        ).paddingAll(spacing_standard_new).onTap(() {
                          widget.isSignIn = false;
                          widget.isSignUp = true;
                          setState(() {});
                        })
                      ],
                    ),
                    widget.isSignUp! ? signUp : signIn
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
