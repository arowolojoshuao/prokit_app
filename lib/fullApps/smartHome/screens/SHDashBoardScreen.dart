import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartHome/component/SHBottomNavbarWidget.dart';
import 'package:prokit_flutter/fullApps/smartHome/fragments/SHHomeFragment.dart';
import 'package:prokit_flutter/fullApps/smartHome/fragments/SHScenesFragment.dart';
import 'package:prokit_flutter/fullApps/smartHome/fragments/SHSpacesFragment.dart';
import 'package:prokit_flutter/fullApps/smartHome/fragments/SHStatisticFragment.dart';
import 'package:prokit_flutter/fullApps/smartHome/utils/SHColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class SHDashBoardScreen extends StatefulWidget {
  static String tag = '/SHDashBoardScreen';

  @override
  SHDashBoardScreenState createState() => SHDashBoardScreenState();
}

class SHDashBoardScreenState extends State<SHDashBoardScreen> {
  int _currentIndex = 0;
  List<Widget> dashBoardScreenList = [
    SHHomeFragment(),
    SHSpacesFragment(),
    SHScenesFragment(),
    SHStatisticFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(
      SHContainerColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
  }

  @override
  void dispose() {
    changeStatusColor(Colors.transparent);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SHScaffoldDarkColor,
      body: dashBoardScreenList[_currentIndex],
      bottomNavigationBar: SHBottomNavbarWidget(
        selectedIndex: _currentIndex,
        showElevation: true,
        curve: Curves.easeIn,
        backgroundColor: SHScaffoldDarkColor,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavyBarItem(icon: Icon(FontAwesome.home), title: Text('Home', style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(icon: Icon(Icons.add_box_rounded), title: Text('Spaces', style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(icon: Icon(Icons.cloud), title: Text('Scenes', style: boldTextStyle(color: Colors.white, size: 14))),
          BottomNavyBarItem(icon: Icon(Icons.bar_chart_rounded), title: Text('Statistic', style: boldTextStyle(color: Colors.white, size: 14))),
        ],
      ).paddingTop(12),
    );
  }
}
