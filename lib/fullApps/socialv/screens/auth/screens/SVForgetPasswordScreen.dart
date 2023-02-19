import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/auth/screens/SVOTPScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/auth/screens/SVSignInScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

class SVForgetPasswordScreen extends StatelessWidget {
  const SVForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: svGetScaffoldColor(),
      body: Column(
        children: [
          SizedBox(height: context.statusBarHeight + 30),
          svHeaderContainer(
            child: Text(
              'Forget Password ?',
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
                  20.height,
                  svRobotoText(text: 'Enter The email Associated With Your \n Account To Receive A Reset Password Mail'),
                  50.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      label: 'Enter Your Email',
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  100.height,
                  svAppButton(
                    context: context,
                    text: 'GET MAIL',
                    onTap: () {
                      SVOTPScreen().launch(context);
                    },
                  ),
                  16.height,
                  svRobotoText(
                    text: 'Back To Login',
                    color: Color(0XFF7B8BB2),
                    onTap: () {
                      finish(context);
                      SVSignInScreen().launch(context);
                    },
                  ),
                ],
              ),
            ),
          ).expand()
        ],
      ),
    );
  }
}
