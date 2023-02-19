import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/fragment/all_news_fragment.dart';
import 'package:prokit_flutter/fullApps/stockMarket/fragment/home_fragment.dart';
import 'package:prokit_flutter/fullApps/stockMarket/fragment/markets_fragment.dart';
import 'package:prokit_flutter/fullApps/stockMarket/fragment/portfolio_fragment.dart';
import 'package:prokit_flutter/fullApps/stockMarket/fragment/profile_fragment.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/colors.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  var _pages = [
    HomeFragment(),
    AllNewsFragment(),
    MarketFragment(),
    PortfolioFragment(),
    ProfileFragment(),
  ];

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedLabelStyle: boldTextStyle(size: 14),
      selectedItemColor: appStore.isDarkModeOn ? white : primaryColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ic_home.iconImage(size: 22),
          label: 'Home',
          activeIcon: ic_fill_home.iconImage(color: appStore.isDarkModeOn ? white : primaryColor, size: 22),
        ),
        BottomNavigationBarItem(
          icon: ic_news.iconImage(size: 22),
          label: 'News',
          activeIcon: ic_fill_news.iconImage(color: appStore.isDarkModeOn ? white : primaryColor, size: 22),
        ),
        BottomNavigationBarItem(
          icon: ic_market.iconImage(size: 22),
          label: 'Markets',
          activeIcon: ic_fill_market.iconImage(color: appStore.isDarkModeOn ? white : primaryColor, size: 22),
        ),
        BottomNavigationBarItem(
          icon: ic_portfolio.iconImage(size: 22),
          label: 'Portfolio',
          activeIcon: ic_fill_portfolio.iconImage(color: appStore.isDarkModeOn ? white : primaryColor, size: 22),
        ),
        BottomNavigationBarItem(
          icon: ic_profile.iconImage(size: 22),
          label: 'Profile',
          activeIcon: ic_fill_profile.iconImage(color: appStore.isDarkModeOn ? white : primaryColor, size: 22),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    // setStatusBarColor(primaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DoublePressBackWidget(
      child: Scaffold(
        bottomNavigationBar: _bottomTab(),
        body: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
