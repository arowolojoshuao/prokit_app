import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMAppointmentFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMChatFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMHomeFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMMoreFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMSearchFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMDashboardModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMDataGenerator.dart';
import 'package:prokit_flutter/main.dart';

class BMDashboardScreen extends StatefulWidget {
  bool flag;

  BMDashboardScreen({required this.flag});

  @override
  _BMDashboardScreenState createState() => _BMDashboardScreenState();
}

class _BMDashboardScreenState extends State<BMDashboardScreen> {
  List<BMDashboardModel> list = getDashboardList();

  int selectedTab = 0;

  Widget getFragment() {
    if (selectedTab == 0) {
      return BMHomeFragment();
    } else if (selectedTab == 1) {
      return BMSearchFragment();
    } else if (selectedTab == 2) {
      return BMAppointmentFragment();
    } else if (selectedTab == 3) {
      return BMChatFragment();
    } else {
      return BMMoreFragment();
    }
  }

  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    if (widget.flag) {
      setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    } else {
      setStatusBarColor(Colors.transparent);
    }

    super.dispose();
  }

  Color getDashboardColor() {
    if (!appStore.isDarkModeOn) {
      if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
        return bmSecondBackgroundColorLight;
      } else {
        return bmLightScaffoldBackgroundColor;
      }
    } else {
      if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
        return bmSecondBackgroundColorDark;
      } else {
        return appStore.scaffoldBackground!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getDashboardColor(),
      body: getFragment(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.cardColor,
        unselectedItemColor: bmPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedTab,
        items: list.map((e) {
          int index = list.indexOf(e);
          return BottomNavigationBarItem(
            icon: Image.asset(e.unSelectedIcon, height: 24, color: bmPrimaryColor),
            activeIcon: index == 0 ? Image.asset(e.selectedIcon, height: 24, color: bmPrimaryColor) : Image.asset(e.selectedIcon, height: 24, color: bmPrimaryColor),
            label: '',
          );
        }).toList(),
      ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
    );
  }
}
