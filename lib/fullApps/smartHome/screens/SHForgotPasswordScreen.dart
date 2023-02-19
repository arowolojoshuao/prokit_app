import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSignInScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHForgotPasswordScreen extends StatefulWidget {
  @override
  SHForgotPasswordScreenState createState() => SHForgotPasswordScreenState();
}

class SHForgotPasswordScreenState extends State<SHForgotPasswordScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Welcome Back\nCameron', style: boldTextStyle(color: white, size: 22)),
                        commonSHCachedNetworkImage(
                          'https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ).cornerRadiusWithClipRRect(30)
                      ],
                    ),
                    16.height,
                    Text('Oh no, this isn\'t me', style: boldTextStyle(color: errorColor)),
                    32.height,
                    AppTextField(
                      textStyle: primaryTextStyle(color: white),
                      cursorColor: white,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: buildSHInputDecoration(
                        'Password',
                        suffixIcon: Icon(Icons.remove_red_eye_rounded, color: white),
                      ),
                    ),
                    16.height,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: boldTextStyle(color: white),
                        textAlign: TextAlign.end,
                      ).onTap(
                        () {
                          SHForgotPasswordScreen().launch(context);
                        },
                      ),
                    ),
                    16.height,
                    button(
                      context: context,
                      textColor: white,
                      width: context.width(),
                      text: 'Forgot password',
                      onTap: () {
                        SHSignInScreen().launch(context);
                      },
                    ),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have account?', style: primaryTextStyle(color: grey)),
                        4.width,
                        Text('Get Started', style: primaryTextStyle(color: white)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
