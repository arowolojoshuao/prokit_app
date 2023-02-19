import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAInstructionStepScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class MIAGuideScreen extends StatelessWidget {
  const MIAGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.height,
            Text('Hands-free cooking', style: boldTextStyle(size: 30)),
            14.height,
            Text(
              'Advance to the next instruction without touching your screen with icky fingers. Hold your hand over the top of your screen until it goes black, then remove.',
              style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor),
            ),
            Container(
              height: 500,
              width: context.width() - 32,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: radiusOnly(topLeft: 32, topRight: 32), color: Colors.grey.shade400),
                      height: 400,
                      width: context.width() - 60,
                    ).center(),
                  ),
                  Positioned(top: 30, child: miaCommonCachedNetworkImage('$BaseUrl/images/mealime/hand.png', color: Colors.grey.shade600, height: 350, fit: BoxFit.cover)),
                  Positioned(
                    bottom: 20,
                    child: AppButton(
                      width: context.width() - 32,
                      color: miaPrimaryColor,
                      text: 'Continue',
                      textStyle: boldTextStyle(color: white),
                      onTap: () {
                        MIAInstructionStepScreen().launch(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
