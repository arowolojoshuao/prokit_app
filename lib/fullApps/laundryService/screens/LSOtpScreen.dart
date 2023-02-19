import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSResetPasswordScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSOtpScreen extends StatefulWidget {
  static String tag = '/LSOtpScreen';

  @override
  LSOtpScreenState createState() => LSOtpScreenState();
}

class LSOtpScreenState extends State<LSOtpScreen> {
  TextEditingController firstDigitCont = TextEditingController();
  TextEditingController secondDigitCont = TextEditingController();
  TextEditingController thirdDigitCont = TextEditingController();
  TextEditingController forthDigitCont = TextEditingController();

  FocusNode firstDigit = FocusNode();
  FocusNode secondDigit = FocusNode();
  FocusNode thirdDigit = FocusNode();
  FocusNode forthDigit = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    afterBuildCreated(() {
      changeStatusColor(appStore.isDarkModeOn ? context.cardColor : white);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Verification Code', center: true, color: context.cardColor),
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            24.height,
            commonCacheImageWidget(LSVerify, 220, fit: BoxFit.cover).center(),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              width: context.width(),
              child: Column(
                children: [
                  24.height,
                  Text('Otp has been sent to your registered \n email account. please verify', style: boldTextStyle(), textAlign: TextAlign.center),
                  24.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      16.width,
                      AppTextField(
                        controller: firstDigitCont,
                        textFieldType: TextFieldType.PHONE,
                        textAlign: TextAlign.center,
                        focus: firstDigit,
                        onChanged: (String newVal) {
                          if (newVal.length == 1) {
                            firstDigit.unfocus();
                            FocusScope.of(context).requestFocus(secondDigit);
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                        ),
                      ).expand(),
                      16.width,
                      AppTextField(
                        controller: secondDigitCont,
                        textFieldType: TextFieldType.PHONE,
                        textAlign: TextAlign.center,
                        focus: secondDigit,
                        onChanged: (String newVal) {
                          if (newVal.length == 1) {
                            secondDigit.unfocus();
                            FocusScope.of(context).requestFocus(thirdDigit);
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                        ),
                      ).expand(),
                      16.width,
                      AppTextField(
                        controller: thirdDigitCont,
                        textFieldType: TextFieldType.PHONE,
                        textAlign: TextAlign.center,
                        focus: thirdDigit,
                        onChanged: (String newVal) {
                          if (newVal.length == 1) {
                            thirdDigit.unfocus();
                            FocusScope.of(context).requestFocus(forthDigit);
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                        ),
                      ).expand(),
                      16.width,
                      AppTextField(
                        controller: forthDigitCont,
                        textFieldType: TextFieldType.PHONE,
                        textAlign: TextAlign.center,
                        focus: forthDigit,
                        onChanged: (String newVal) {
                          if (newVal.length == 1) {
                            forthDigit.unfocus();
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: LSColorPrimary)),
                        ),
                      ).expand(),
                      16.width,
                    ],
                  ),
                  24.height,
                ],
              ),
            ),
            24.height,
            AppButton(
              text: 'VERIFY',
              color: LSColorPrimary,
              textColor: white,
              width: context.width(),
              onTap: () {
                LSResetPasswordScreen().launch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
