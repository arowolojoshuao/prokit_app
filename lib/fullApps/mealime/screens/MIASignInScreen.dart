import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/main.dart';

class MIASignInScreen extends StatelessWidget {
  const MIASignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign In', style: boldTextStyle(size: 30)),
            16.height,
            16.height,
            Text('Email address', style: boldTextStyle()),
            8.height,
            Container(
              decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor, borderRadius: radius(8)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppTextField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: miaPrimaryColor,
                autoFocus: true,
                textFieldType: TextFieldType.EMAIL,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            16.height,
            Text('Password', style: boldTextStyle()),
            8.height,
            Container(
              decoration: BoxDecoration(color: appStore.isDarkModeOn ? context.cardColor : miaContainerSecondaryColor, borderRadius: radius(8)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppTextField(
                cursorColor: miaPrimaryColor,
                autoFocus: true,
                textFieldType: TextFieldType.PASSWORD,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            30.height,
            AppButton(
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Done',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                MIADashboardScreen().launch(context);
              },
            ),
            16.height,
            RichText(
              text: TextSpan(
                text: 'By using Mealime you agree to our ',
                style: secondaryTextStyle(),
                children: const <TextSpan>[
                  TextSpan(text: 'Terms', style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
                ],
              ),
            ).center(),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
