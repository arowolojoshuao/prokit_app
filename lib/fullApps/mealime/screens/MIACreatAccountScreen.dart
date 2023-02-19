import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAStepScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/main.dart';

class MIACreatAccountScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create an account', style: boldTextStyle(size: 30)),
            16.height,
            Text('Share your account with your family and across devices.', style: primaryTextStyle(color: miaSecondaryTextColor)),
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
                controller: email,
                // Optional
                textFieldType: TextFieldType.EMAIL,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            16.height,
            AppButton(
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Done',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                MIAStepScreen().launch(context);
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
