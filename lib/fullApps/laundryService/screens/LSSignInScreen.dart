import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSForgotPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSOnBoardingScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSSignInScreen extends StatefulWidget {
  static String tag = '/LSSignInScreen';

  @override
  LSSignInScreenState createState() => LSSignInScreenState();
}

class LSSignInScreenState extends State<LSSignInScreen> {
  bool isSignUp = false;
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  TextEditingController cPassCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    afterBuildCreated(() {
      changeStatusColor(appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary);
    });
  }

  @override
  void dispose() {
    super.dispose();
    afterBuildCreated(() {
      changeStatusColor(Colors.transparent);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              8.height,
              commonCacheImageWidget(LSLogo, 120, fit: BoxFit.cover).center(),
              Text('Laundry Service', style: boldTextStyle(size: 28, color: LSColorPrimary)),
              16.height,
              Container(
                decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
                width: context.width(),
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: isSignUp ? LSColorSecondary : LSColorPrimary,
                          padding: EdgeInsets.only(left: 20, right: 16, top: 8, bottom: 8),
                          child: Text('Sign In', style: boldTextStyle(color: !isSignUp ? white : black)),
                        ).cornerRadiusWithClipRRectOnly(topLeft: 30, bottomLeft: 30).onTap(() {
                          isSignUp = false;
                          setState(() {});
                        }),
                        Container(
                          alignment: Alignment.center,
                          color: isSignUp ? LSColorPrimary : LSColorSecondary,
                          padding: EdgeInsets.only(left: 16, right: 20, top: 8, bottom: 8),
                          child: Text('Sign Up', style: boldTextStyle(color: isSignUp ? white : black)),
                        ).cornerRadiusWithClipRRectOnly(topRight: 30, bottomRight: 30).onTap(() {
                          isSignUp = true;
                          setState(() {});
                        }),
                      ],
                    ),
                    16.height,
                    Text(isSignUp ? 'Please enter your information below.' : 'Please login to your account', style: boldTextStyle()),
                    16.height,
                    AppTextField(
                      controller: emailCont,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: InputDecoration(hintText: 'Email Id'),
                    ),
                    16.height,
                    AppTextField(
                      controller: passCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    16.height,
                    AppTextField(
                      controller: cPassCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(hintText: 'Confirm Password'),
                    ).visible(isSignUp),
                    16.height.visible(isSignUp),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text('Forgot Password?', style: primaryTextStyle(color: LSColorPrimary)),
                    ).onTap(() {
                      LSForgotPasswordScreen().launch(context);
                    }).visible(!isSignUp),
                    16.height,
                  ],
                ),
              ),
              16.height,
              Container(
                height: 50,
                width: 130,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(50)),
                child: Icon(Icons.arrow_right_alt, color: white, size: 40),
              ).onTap(() {
                if (!isSignUp) {
                  LSOnBoardingScreen().launch(context);
                } else {
                  isSignUp = !isSignUp;
                  setState(() {});
                }
              }),
              24.height.visible(!isSignUp),
              Text('You can also login with', style: boldTextStyle()).visible(!isSignUp),
              8.height.visible(!isSignUp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    color: white,
                    child: Image.network(LSGoogle, height: 30, width: 30),
                  ).cornerRadiusWithClipRRect(25),
                  8.width,
                  Container(
                    height: 50,
                    width: 50,
                    color: white,
                    child: Image.network(LSFb, height: 40, width: 40),
                  ).cornerRadiusWithClipRRect(25)
                ],
              ).visible(!isSignUp)
            ],
          ),
        ),
      ),
    );
  }
}
