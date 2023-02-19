import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';

class MIAStepScreen extends StatelessWidget {
  const MIAStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          100.height,
          Text('Healthy eating made easy in 3 simple steps', style: boldTextStyle(size: 30)).center(),
          Image.asset('images/mealime/path_image.png', height: 400),
          50.height,
          AppButton(
            width: context.width() - 32,
            color: miaPrimaryColor,
            text: 'Got it',
            textStyle: boldTextStyle(color: white),
            onTap: () {
              MIADashboardScreen().launch(context);
            },
          ).center(),
          20.height,
        ],
      ).paddingSymmetric(horizontal: 16),
    ));
  }
}
