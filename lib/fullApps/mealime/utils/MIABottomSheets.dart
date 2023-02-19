import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIASelectOptionsModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIACollectionScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAFeedbackScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAGuideScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIANotesScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';

void showBuildMealBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            Text('Build your first meal plan', style: boldTextStyle(size: 24)),
            16.height,
            Text(
              'Add a few recipes to cook this week, and we\'ll build you an easy-to-shop grocery list.',
              style: primaryTextStyle(color: miaSecondaryTextColor, size: 18),
            ),
            30.height,
            AppButton(
              width: context.width() - 32,
              color: miaContainerSecondaryColor,
              text: 'Got it',
              textStyle: boldTextStyle(color: miaSecondaryColor),
              onTap: () {
                finish(context);
              },
            ),
            30.height,
          ],
        ).paddingAll(16);
      });
}

void showActionMenuBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.height,
            SettingItemWidget(
              title: 'Nutrition Facts',
              leading: Icon(Icons.info_outline, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
            ),
            Divider(),
            SettingItemWidget(
              title: 'Open Cooking Mode',
              leading: Icon(Icons.timer, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
                MIAGuideScreen().launch(context);
              },
            ),
            Divider(),
            SettingItemWidget(
              title: 'Add Notes',
              leading: Icon(LineIcons.pen, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
                MIANotesScreen().launch(context);
              },
            ),
            Divider(),
            SettingItemWidget(
              title: 'Share',
              leading: Icon(Icons.share_outlined, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
            ),
            Divider(),
            SettingItemWidget(
              title: 'Print',
              leading: Icon(Icons.print, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
            ),
            Divider(),
            SettingItemWidget(
              title: 'Feedback for chef',
              leading: Icon(Icons.messenger_outline, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
                MIAFeedbackScreen().launch(context);
              },
            ),
            Divider(),
            SettingItemWidget(
              title: 'Add to collections',
              leading: Icon(Icons.info_outline, color: miaSecondaryTextColor),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
                MIACollectionScreen().launch(context);
              },
            ),
            20.height,
          ],
        );
      });
}

void showTimerBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      // isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.height,
            Text('5 minutes', style: secondaryTextStyle(color: miaSecondaryTextColor)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('4 : 54', style: boldTextStyle(size: 30)),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: miaContainerColor, borderRadius: radius(miaDefaultRadius)),
                  child: Text('+ 1 min', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.black : Colors.white)),
                )
              ],
            ),
            16.height,
            Text(
              'Once done, remove rice from the heat and let it stand, still covered, for 5 minutes.',
              style: primaryTextStyle(color: miaSecondaryTextColor, size: 18),
            ),
            20.height,
            AppButton(
              width: context.width() - 32,
              color: miaContainerSecondaryColor,
              text: 'Cancel timer',
              textStyle: boldTextStyle(color: miaSecondaryColor),
              onTap: () {
                finish(context);
              },
            ),
            12.height,
            AppButton(
              width: context.width() - 32,
              color: miaContainerSecondaryColor,
              text: 'Show Step 3',
              textStyle: boldTextStyle(color: miaSecondaryColor),
              onTap: () {
                finish(context);
              },
            ),
            20.height,
          ],
        ).paddingAll(16);
      });
}

void showGroceryBottomSheet(BuildContext context) {
  List<MIASelectOptionsModel> list = getGroceryBottomSheetList();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: false,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Text('Grocery shopping made easy', style: boldTextStyle(size: 24)),
            16.height,
            ...List.generate(list.length, (index) {
              int step = index + 1;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Step ${step.toString()}', style: secondaryTextStyle(color: miaSecondaryTextColor)),
                  6.height,
                  Text(list[index].title, style: boldTextStyle()),
                ],
              ).paddingSymmetric(vertical: 8);
            }),
            30.height,
            AppButton(
              width: context.width() - 32,
              color: miaContainerSecondaryColor,
              text: 'Got it',
              textStyle: boldTextStyle(color: miaSecondaryColor),
              onTap: () {
                finish(context);
              },
            ),
            30.height,
          ],
        ).paddingAll(16);
      });
}

void showSettingsBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.height,
            SettingItemWidget(
                title: 'Edit your account',
                leading: Icon(Icons.account_circle_outlined, color: miaSecondaryTextColor, size: 30),
                titleTextStyle: boldTextStyle(),
                onTap: () {
                  finish(context);
                }),
            Divider(),
            SettingItemWidget(
              title: 'Switch accounts',
              leading: Icon(Icons.swap_horiz, color: miaSecondaryTextColor, size: 30),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
              },
            ),
            Divider(),
            SettingItemWidget(
              title: 'Upgrade to pro',
              leading: Icon(Icons.monetization_on_outlined, color: miaSecondaryTextColor, size: 30),
              titleTextStyle: boldTextStyle(),
              onTap: () {
                finish(context);
              },
            ),
            20.height,
          ],
        );
      });
}
