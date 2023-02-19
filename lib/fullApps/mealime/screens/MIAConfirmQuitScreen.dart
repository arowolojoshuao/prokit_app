import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:prokit_flutter/fullApps/mealime/models/MIAIngredientModel.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MIAConfirmQuitScreen extends StatelessWidget {
  final List<MIAInstructionsModel> instructions = getInstructions();

  void displayAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CustomTheme(
              child: CupertinoAlertDialog(
                title: Column(
                  children: [
                    Text('Leave and cancel timers?', style: boldTextStyle(color: appStore.textPrimaryColor, size: 18)),
                    Text('If you leave cooking mode your active timers will lost', style: primaryTextStyle()),
                  ],
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'Leave cooking mode',
                      style: primaryTextStyle(color: dodgerBlue, size: 18),
                    ),
                    onPressed: () {
                      finish(context);
                      finish(context);
                      finish(context);
                      finish(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      'Continue Cooking',
                      style: primaryTextStyle(color: dodgerBlue, size: 18),
                    ),
                    onPressed: () {
                      finish(context);
                    },
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            40.height,
            ...List.generate(instructions.length, (index) {
              int insNo = index + 1;
              return Row(
                children: [
                  SizedBox(
                    height: 160,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(insNo.toString(), style: boldTextStyle(size: 30)),
                    ),
                  ),
                  10.width,
                  SizedBox(
                    height: 160,
                    child: Text(
                      instructions[index].title,
                      style: boldTextStyle(size: 20),
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ).expand(),
                  10.width,
                  Icon(Icons.arrow_forward_ios, color: miaContainerSecondaryColor)
                ],
              ).paddingSymmetric(vertical: 8);
            }),
            AppButton(
              width: context.width() - 32,
              color: miaContainerSecondaryColor,
              text: 'Leave cooking mode',
              textStyle: boldTextStyle(color: miaSecondaryColor),
              onTap: () {
                displayAlertDialog(context);
              },
            ),
            16.height,
            AppButton(
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Continue cooking',
              textStyle: boldTextStyle(),
              onTap: () {
                finish(context);
              },
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
