import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/components/MIAAddMealBotttomNavComponent.dart';
import 'package:prokit_flutter/fullApps/mealime/components/MealContainerComponent.dart';
import 'package:prokit_flutter/fullApps/mealime/screens/MIASplashScreen.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIABottomSheets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MIABuildMealScreen extends StatefulWidget {
  const MIABuildMealScreen({Key? key}) : super(key: key);

  @override
  State<MIABuildMealScreen> createState() => _MIABuildMealScreenState();
}

class _MIABuildMealScreenState extends State<MIABuildMealScreen> {
  bool elementAdded = false;

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
    if (miaStore.addedMeals.isEmpty) {
      Future.delayed(Duration(seconds: 0)).then((_) {
        showBuildMealBottomSheet(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                miaCommonCachedNetworkImage('$BaseUrl/images/mealime/x.png', height: 20, color: context.iconColor).onTap(() {
                  finish(context);
                }),
                Icon(LineIcons.search, size: 30)
              ],
            ).paddingSymmetric(horizontal: 16),
            16.height,
            Text('Build a meal plan', style: boldTextStyle(size: 26)).paddingSymmetric(horizontal: 16),
            20.height,
            MealContainerComponent(header: 'Most Popular', mealList: mealMostPopularList),
            30.height,
            MealContainerComponent(header: 'Recently Created', mealList: mealRecentlyCreatedList),
            30.height,
            Container(
              width: context.width() - 32,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationDefault(borderRadius: radius(miaDefaultRadius), color: context.cardColor),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('RECOMMENDED PLANS', style: boldTextStyle(color: miaSecondaryTextColor)),
                      8.height,
                      Text('Perfect plans, customized for you.', style: boldTextStyle(size: 20)),
                      30.height,
                      Text('See Meal Plan', style: primaryTextStyle(color: miaPrimaryColor))
                    ],
                  ).expand(),
                  miaCommonCachedNetworkImage('$BaseUrl/images/recipe/walkThroughImages/imageThree.png', height: 100, fit: BoxFit.cover),
                ],
              ),
            ),
            30.height,
            MealContainerComponent(header: 'Top Rated', mealList: mealTopRatedList),
            30.height,
            MealContainerComponent(header: 'Quick & Easy', mealList: mealQuickEasyList),
            50.height,
          ],
        ),
      ),
      bottomNavigationBar: MIAAddMealBotttomNavComponent(),
    );
  }
}
