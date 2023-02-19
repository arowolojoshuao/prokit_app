import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/auth/screens/SVPasswordSetSuccessScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVResetPasswordScreen extends StatelessWidget {
  const SVResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      body: Column(
        children: [
          SizedBox(height: context.statusBarHeight + 30),
          svHeaderContainer(
            child: Text(
              'Reset Password',
              style: boldTextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ).paddingOnly(bottom: 16),
            context: context,
          ),
          Container(
            width: context.width(),
            color: context.cardColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  50.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    textStyle: boldTextStyle(),
                    suffixIconColor: svGetBodyColor(),
                    suffixPasswordInvisibleWidget: Image.asset('images/socialv/icons/ic_Hide.png', height: 16, width: 16, fit: BoxFit.fill).paddingSymmetric(vertical: 16, horizontal: 14),
                    suffixPasswordVisibleWidget: svRobotoText(text: 'Show', color: SVAppColorPrimary).paddingOnly(top: 20),
                    decoration: svInputDecoration(
                      context,
                      label: 'New Password',
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    textStyle: boldTextStyle(),
                    suffixIconColor: svGetBodyColor(),
                    suffixPasswordInvisibleWidget: Image.asset('images/socialv/icons/ic_Hide.png', height: 16, width: 16, fit: BoxFit.fill).paddingSymmetric(vertical: 16, horizontal: 14),
                    suffixPasswordVisibleWidget: svRobotoText(text: 'Show', color: SVAppColorPrimary).paddingOnly(top: 20),
                    decoration: svInputDecoration(
                      context,
                      label: 'Confirm Password',
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  100.height,
                  svAppButton(
                      context: context,
                      text: 'SUBMIT',
                      onTap: () {
                        SVPasswordSetSuccessScreen().launch(context);
                      }),
                  10.height,
                  svRobotoText(text: 'Enter your new password below.'),
                ],
              ),
            ),
          ).expand()
        ],
      ),
    );
  }
}
