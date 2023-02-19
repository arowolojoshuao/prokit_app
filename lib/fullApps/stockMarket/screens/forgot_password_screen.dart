import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/otp_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailCont = TextEditingController();

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
      appBar: commonAppBarWidget(context, changeIcon: false, title: ""),
      bottomNavigationBar: CommonButton(
          buttonText: "Continue",
          margin: 16,
          width: context.width(),
          onTap: () {
            OtpScreen().launch(context);
          }).paddingOnly(bottom: 24),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.height,
            commonImageWidget(image: forgot_password),
            42.height,
            Text('Forgot Password?', style: boldTextStyle(size: 24)),
            16.height,
            Text(
              'Don\'t worry! Please enter the email below \nassociated with your account.',
              textAlign: TextAlign.center,
              style: secondaryTextStyle(height: 1.5),
            ),
            32.height,
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: emailCont,
              decoration: inputDecoration(context, labelText: "Email", prefixIcon: ic_message.iconImage(size: 10).paddingAll(14)),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
