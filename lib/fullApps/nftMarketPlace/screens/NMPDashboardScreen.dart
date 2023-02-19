import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPHomeFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPMoreFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPProfileFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPRankingsFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/fragments/NMPSearchFragment.dart';
import 'package:prokit_flutter/fullApps/nftMarketPlace/utils/NMPCommon.dart';
import 'package:prokit_flutter/main.dart';

class NMPDashboardScreen extends StatefulWidget {
  @override
  State<NMPDashboardScreen> createState() => _NMPDashboardScreenState();
}

class _NMPDashboardScreenState extends State<NMPDashboardScreen> {
  int index = 0;
  List<Widget> widgets = [NMPHomeFragment(), NMPRankingsFragment(), NMPSearchFragment(), NMPProfileFragment(), NMPMoreFragment()];

  @override
  void initState() {
    osSetStatusBarColor(statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.transparent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (i) {
          index = i;
          setState(
            () {},
          );
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Rankings'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz_outlined), label: 'More'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
