import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHDashBoardScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/screens/SHSignInScreen.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHComman.dart';

class SHSigUPScreen extends StatefulWidget {
  @override
  SHSigUPScreenState createState() => SHSigUPScreenState();
}

class SHSigUPScreenState extends State<SHSigUPScreen> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New\nAccount', style: boldTextStyle(color: white, size: 25)),
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.camera_alt_outlined, color: grey),
                              8.height,
                              Text('Upload', style: secondaryTextStyle(color: grey)),
                            ],
                          ),
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
                      textFieldType: TextFieldType.OTHER,
                      decoration: buildSHInputDecoration('First Name', textColor: Colors.grey),
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
                    RichTextWidget(
                      list: [
                        TextSpan(
                          text: 'You have agreed to our ',
                          style: secondaryTextStyle(color: grey, size: 14),
                        ),
                        TextSpan(text: 'Terms of Services\n', style: boldTextStyle(color: white, size: 12)),
                        TextSpan(
                          text: 'when connection to sign up.',
                          style: secondaryTextStyle(color: grey, size: 14),
                        ),
                      ],
                    ),
                    32.height,
                    button(
                        context: context,
                        textColor: white,
                        width: context.width(),
                        text: 'Get Started',
                        onTap: () {
                          SHDashBoardScreen().launch(context);
                        }),
                    32.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?', style: primaryTextStyle(color: grey)),
                        4.width,
                        Text('Sign In', style: primaryTextStyle(color: white)).onTap(
                          () {
                            SHSignInScreen().launch(context);
                          },
                        ),
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
