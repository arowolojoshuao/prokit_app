import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/mealime/fragments/MIAFavFragment.dart';
import 'package:prokit_flutter/fullApps/mealime/fragments/MIASettingsFragment.dart';
import 'package:prokit_flutter/fullApps/mealime/fragments/MIAGroceryFragment.dart';
import 'package:prokit_flutter/fullApps/mealime/fragments/MIAMealPlanFragment.dart';
import 'package:prokit_flutter/fullApps/mealime/models/MIADashboardModel.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIAColors.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIADataGenerator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/mealime/utils/MIACommomWidgets.dart';

class MIADashboardScreen extends StatefulWidget {
  const MIADashboardScreen({Key? key}) : super(key: key);

  @override
  _MIADashboardScreenState createState() => _MIADashboardScreenState();
}

class _MIADashboardScreenState extends State<MIADashboardScreen> {
  int selectedTab = 0;

  List<MIADashboardModel> fragmentList = getFragmentsList();

  Widget getFragment() {
    if (selectedTab == 0) {
      return MIAMealPlanFragment();
    } else if (selectedTab == 1) {
      return MIAGroceryFragment();
    } else if (selectedTab == 2) {
      return MIAFavFragment();
    } else {
      return MIASettingsFragment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getFragment(),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: fragmentList.map((e) {
              int index = fragmentList.indexOf(e);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(e.image,
                      height: 26,
                      width: 26,
                      fit: BoxFit.cover,
                      color: selectedTab == index
                          ? miaPrimaryColor
                          : appStore.isDarkModeOn
                              ? Colors.white54
                              : miaSecondaryColor),
                  Text(e.tab,
                      style: secondaryTextStyle(
                          color: selectedTab == index
                              ? miaPrimaryColor
                              : appStore.isDarkModeOn
                                  ? Colors.white54
                                  : miaSecondaryColor,
                          size: 12))
                ],
              ).onTap(() {
                selectedTab = index;
                setState(() {});
              });
            }).toList(),
          ),
        ));
  }
}
