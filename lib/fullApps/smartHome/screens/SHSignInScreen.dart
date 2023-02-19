import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHForgotPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

import 'SHSignUpScreen.dart';

class SHSignInScreen extends StatefulWidget {
  @override
  SHSignInScreenState createState() => SHSignInScreenState();
}

class SHSignInScreenState extends State<SHSignInScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            commonSHCachedNetworkImage(
              'https://cdn.pixabay.com/photo/2015/11/04/10/38/hotel-1022297_960_720.jpg',
              fit: BoxFit.fill,
              height: context.height(),
              width: context.width(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: SHScaffoldDarkColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                width: context.width(),
                height: context.height() * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Welcome\nBack', style: boldTextStyle(color: white, size: 25)),
                          Container(
                            height: 78,
                            width: 75,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: grey),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: commonSHCachedNetworkImage('https://i.dlpng.com/static/png/6981952_preview.png', fit: BoxFit.cover, height: 45, width: 45),
                          )
                        ],
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: white),
                        cursorColor: white,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: buildSHInputDecoration('Email', textColor: Colors.grey),
                      ),
                      16.height,
                      AppTextField(
                        textStyle: primaryTextStyle(color: white),
                        cursorColor: white,
                        textFieldType: TextFieldType.PASSWORD,
                        suffixIconColor: white,
                        suffix: Icon(Icons.remove_red_eye_rounded, color: white),
                        decoration: buildSHInputDecoration('Password', textColor: Colors.grey),
                      ),
                      16.height,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password?', style: boldTextStyle(color: white), textAlign: TextAlign.end).onTap(
                          () {
                            SHForgotPasswordScreen().launch(context);
                          },
                        ),
                      ),
                      80.height,
                      button(
                        context: context,
                        textColor: white,
                        width: context.width(),
                        text: 'Sign In',
                        onTap: () {
                          SHDashBoardScreen().launch(context);
                        },
                      ),
                      32.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account?', style: primaryTextStyle(color: grey)),
                          4.width,
                          Text('Get Started', style: boldTextStyle(color: white, size: 16)).onTap(
                            () {
                              SHSigUPScreen().launch(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
