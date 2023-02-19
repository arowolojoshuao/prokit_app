import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fNameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

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
      appBar: commonAppBarWidget(context, changeIcon: true, title: ""),
      bottomNavigationBar: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "By continuing, you agree to the ",
          style: secondaryTextStyle(height: 1.3),
          children: [
            TextSpan(
              text: "Stock Platform Terms & Conditions. Reward Policy,",
              style: boldTextStyle(size: 14),
            ),
            TextSpan(
              text: " and ",
              style: secondaryTextStyle(),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: boldTextStyle(size: 14),
            ),
          ],
        ),
      ).paddingOnly(bottom: 24, left: 24, right: 24),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to Stock', style: boldTextStyle(size: 24)),
            16.height,
            Text('Create a commintent-free profile to explore stock products and rewards.', style: secondaryTextStyle()),
            28.height,
            commonSocialLoginButton(context),
            24.height,
            Row(
              children: [
                Container(color: gray.withOpacity(0.2), height: 1).expand(),
                12.width,
                Text('Or continue with email', style: secondaryTextStyle()),
                12.width,
                Container(color: gray.withOpacity(0.2), height: 1).expand(),
              ],
            ),
            24.height,
            AppTextField(
              textFieldType: TextFieldType.NAME,
              controller: fNameCont,
              nextFocus: emailFocus,
              decoration: inputDecoration(context, labelText: "Full name", prefixIcon: ic_profile.iconImage(size: 10).paddingAll(14)),
            ),
            16.height,
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: emailCont,
              focus: emailFocus,
              nextFocus: passwordFocus,
              decoration: inputDecoration(context, labelText: "Email", prefixIcon: ic_message.iconImage(size: 10).paddingAll(14)),
            ),
            16.height,
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: passwordCont,
              focus: passwordFocus,
              suffixPasswordVisibleWidget: ic_show.iconImage(size: 10).paddingAll(14),
              suffixPasswordInvisibleWidget: ic_hide.iconImage(size: 10).paddingAll(14),
              decoration: inputDecoration(context, labelText: "Password", prefixIcon: ic_lock.iconImage(size: 10).paddingAll(14)),
            ),
            32.height,
            CommonButton(
                buttonText: "Continue",
                width: context.width(),
                onTap: () {
                  finish(context);
                }),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
