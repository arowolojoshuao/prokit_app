import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/fragments/account_fragment.dart';
import 'package:prokit_flutter/fullApps/homeService/fragments/bookings_fragment.dart';
import 'package:prokit_flutter/fullApps/homeService/fragments/home_fragment.dart';
import 'package:prokit_flutter/fullApps/homeService/fragments/search_fragment.dart';
import 'package:prokit_flutter/main.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final _pageItem = [
    HomeFragment(),
    SearchFragment(),
    BookingsFragment(fromProfile: false),
    AccountFragment(),
  ];
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageItem[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 28, opacity: 1),
        unselectedIconTheme: IconThemeData(size: 28, opacity: 0.5),
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        selectedItemColor: appStore.isDarkModeOn ? white : black,
        elevation: 40,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 20),
            activeIcon: Icon(Icons.home_rounded, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined, size: 20),
            activeIcon: Icon(Icons.account_balance_wallet, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined, size: 20),
            activeIcon: Icon(Icons.calendar_month_outlined, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 20),
            activeIcon: Icon(Icons.person, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "Account",
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue) {
          _selectedItem = setValue;
          setState(() {});
        },
      ),
    );
  }
}
