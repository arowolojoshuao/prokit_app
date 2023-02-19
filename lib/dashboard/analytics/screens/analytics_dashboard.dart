import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/analytics/fragments/analytics_dashboard_fragment.dart';
import 'package:prokit_flutter/dashboard/analytics/fragments/explore_fragment.dart';
import 'package:prokit_flutter/dashboard/analytics/fragments/profile_fragment.dart';
import 'package:prokit_flutter/dashboard/analytics/fragments/tools_fragment.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class AnalyticsDashboard extends StatefulWidget {
  @override
  _AnalyticsDashboardState createState() => _AnalyticsDashboardState();
}

class _AnalyticsDashboardState extends State<AnalyticsDashboard> {
  int _selectedItemIndex = 0;

  List<Widget> _pages = [
    AnalyticsDashboardFragment(),
    ExploreFragment(),
    ToolsFragment(),
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
      type: BottomNavigationBarType.fixed,
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      elevation: 20,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedFontSize: 14,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Dashboard', ic_signal),
          activeIcon: customBottomNav(context, true, 'Dashboard', ic_signal),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Explore', ic_explore),
          activeIcon: customBottomNav(context, true, 'Explore', ic_explore),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Tools', ic_tools),
          activeIcon: customBottomNav(context, true, 'Tools', ic_tools),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, 'Profile', ic_analytics_profile),
          activeIcon: customBottomNav(context, true, 'Profile', ic_analytics_profile),
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
          Image.asset(icon, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          8.height,
          Text('$text', style: boldTextStyle(size: 14, color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
        ],
      );
    } else {
      return Column(
        children: [
          Image.asset(icon, height: 16, width: 16, color: Colors.grey),
          Text('$text', style: primaryTextStyle(color: Colors.grey)),
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
