import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
/*import 'package:otp_text_field/otp_field.dart' as otp;
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';*/
import 'package:prokit_flutter/fullApps/stockMarket/screens/face_id_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/constant.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  TextEditingController otpController = TextEditingController();

  FocusNode otpFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    startTimer();
  }

  Widget otpField() {
    return Wrap(
      spacing: 24,
      children: [
        OTPTextField(
          fieldWidth: 50,
          onCompleted: (pin) {
            log("Completed: " + pin);
          },
          pinLength: 5,
          showUnderline: false,
          decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.isDarkModeOn ? dividerDarkColor : gray.withOpacity(0.1)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, changeIcon: true, title: ""),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Authentication Code', style: boldTextStyle(size: 24)),
            16.height,
            Text(mlAuthentication_msg!, style: secondaryTextStyle(height: 1.5)),
            24.height,
            otpField(),
            32.height,
            Center(
              child: Text(
                mlHave_no_code!,
                style: boldTextStyle(color: appStore.isDarkModeOn ? white : primaryColor.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
            ),
            80.height,
            CommonButton(
                buttonText: "Continue",
                width: context.width(),
                onTap: () {
                  FaceIdScreen().launch(context);
                }),
          ],
        ).paddingAll(16.0),
      ),
    );
  }
}
