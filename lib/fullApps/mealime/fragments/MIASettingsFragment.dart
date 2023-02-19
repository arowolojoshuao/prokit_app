import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIADashboardModel.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIAUpgradeScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIABottomSheets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class MIASettingsFragment extends StatefulWidget {
  const MIASettingsFragment({Key? key}) : super(key: key);

  @override
  State<MIASettingsFragment> createState() => _MIASettingsFragmentState();
}

class _MIASettingsFragmentState extends State<MIASettingsFragment> {
  List<MIADashboardModel> settingList = getSettingsList();

  @override
  void initState() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            70.height,
            miaCommonCachedNetworkImage('$BaseUrl/images/mealime/faceOne.jpg', height: 150, width: 150).cornerRadiusWithClipRRect(100).onTap(() {
              showSettingsBottomSheet(context);
            }),
            /*    Icon(Icons.account_circle_outlined, color: miaSecondaryColor, size: 100).onTap(() {
              showSettingsBottomSheet(context);
            }).center(),*/
            16.height,
            Text('ramy@example.co.uk', style: boldTextStyle(color: miaSecondaryColor, size: 20)),
            20.height,
            Divider(),
            Container(
              decoration: BoxDecoration(color: miaPrimaryColor.withAlpha(30), borderRadius: radius(miaDefaultRadius)),
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upgrade to Pro', style: boldTextStyle(color: miaPrimaryColor, size: 24)),
                      8.height,
                      Text('Get exclusive recipes, nutritional information, advanced filters, and more.', style: secondaryTextStyle(color: miaPrimaryColor)),
                    ],
                  ).expand(),
                  Icon(Icons.arrow_forward_ios, color: miaSecondaryTextColor)
                ],
              ),
            ).onTap(() {
              MIAUpgradeScreen().launch(context);
            }),
            Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(color: miaPrimaryColor.withAlpha(30), borderRadius: radius(100)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('1', style: boldTextStyle(color: miaPrimaryColor)), Text('lb', style: secondaryTextStyle(color: miaPrimaryColor))],
                  ),
                ),
                8.width,
                Text('Food Waste Savings', style: boldTextStyle())
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 8),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: settingList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        miaCommonCachedNetworkImage(e.image, height: 30, color: context.iconColor),
                        30.width,
                        Text(e.tab, style: boldTextStyle()),
                      ],
                    ).paddingSymmetric(vertical: 12, horizontal: 16),
                    Divider()
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
