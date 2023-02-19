import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/smart_home/fragments/alart_fragment.dart';
import 'package:prokit_flutter/dashboard/smart_home/fragments/dashboard_fragment.dart';
import 'package:prokit_flutter/dashboard/smart_home/fragments/profile_fragment.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/colors.dart';
import 'package:prokit_flutter/dashboard/smart_home/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class SmartHomeDashboard extends StatefulWidget {
  @override
  _SmartHomeDashboardState createState() => _SmartHomeDashboardState();
}

class _SmartHomeDashboardState extends State<SmartHomeDashboard> {
  int _selectedItemIndex = 0;

  List<Widget> _pages = [
    DashBoardFragment(),
    AlartFragment(),
    ProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      backgroundColor: appStore.isDarkModeOn ? Colors.black87 : Colors.cyan.withOpacity(0.5),
      type: BottomNavigationBarType.fixed,
      elevation: 40,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedFontSize: 14,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Dashboard', ic_dashboard),
          activeIcon: customBottomNav(context, true, 'Dashboard', ic_dashboard),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Alart', ic_alert),
          activeIcon: customBottomNav(context, true, 'Alart', ic_alert),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Profile', ic_profile),
          activeIcon: customBottomNav(context, true, 'Profile', ic_profile),
          label: '',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  Widget customBottomNav(BuildContext context, bool isActiveIcon, String text, String icon) {
    if (isActiveIcon) {
      return Column(
        children: [
          Image.asset(icon, height: 16, width: 16, color: appStore.isDarkModeOn ? primaryHomeColor1 : Colors.white),
          8.height,
          Text('$text', style: boldTextStyle(size: 14, color: appStore.isDarkModeOn ? primaryHomeColor1 : Colors.white)),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(icon, height: 20, width: 20, color: appStore.isDarkModeOn ? bottomNavBarIconColor : Colors.black),
          Text('$text', style: primaryTextStyle(color: appStore.isDarkModeOn ? bottomNavBarIconColor : Colors.black)),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: _pages[_selectedItemIndex],
    );
  }
}
