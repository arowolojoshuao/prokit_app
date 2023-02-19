import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/screens/SVDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';

class SVSignUpComponent extends StatefulWidget {
  final VoidCallback? callback;

  SVSignUpComponent({this.callback});

  @override
  State<SVSignUpComponent> createState() => _SVSignUpComponentState();
}

class _SVSignUpComponentState extends State<SVSignUpComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      color: context.cardColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('Hello User', style: boldTextStyle(size: 24)).paddingSymmetric(horizontal: 16),
            8.height,
            Text('Create Your Account For Better Experience', style: secondaryTextStyle(weight: FontWeight.w500, color: svGetBodyColor())).paddingSymmetric(horizontal: 16),
            Container(
              child: Column(
                children: [
                  30.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      label: 'Username',
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  8.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    textStyle: boldTextStyle(),
                    decoration: svInputDecoration(
                      context,
                      label: 'Your Email',
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
                      label: 'Password',
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  10.height,
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    decoration: svInputDecoration(
                      context,
                      label: 'Contact Number',
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('+144', style: boldTextStyle(size: 14)),
                          6.width,
                          Icon(Icons.keyboard_arrow_down, size: 16, color: svGetBodyColor()),
                        ],
                      ),
                      labelStyle: secondaryTextStyle(weight: FontWeight.w600, color: svGetBodyColor()),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  80.height,
                  svAppButton(
                    context: context,
                    text: 'SIGN UP',
                    onTap: () {
                      SVDashboardScreen().launch(context);
                    },
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      svRobotoText(text: 'Already Have An Account?'),
                      4.width,
                      Text(
                        'Sign In',
                        style: secondaryTextStyle(color: SVAppColorPrimary, decoration: TextDecoration.underline),
                      ).onTap(() {
                        widget.callback?.call();
                      }, highlightColor: Colors.transparent, splashColor: Colors.transparent)
                    ],
                  ),
                  50.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
