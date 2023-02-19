import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/contact_split_bill_fragment.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/home_split_bill_fragment.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/search_split_bill_fragment.dart';
import 'package:prokit_flutter/dashboard/split_bill/fragments/payment_split_bill_fragment.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/colors.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class SplitBillDashboard extends StatefulWidget {
  @override
  _SplitBillDashboardState createState() => _SplitBillDashboardState();
}

class _SplitBillDashboardState extends State<SplitBillDashboard> {
  int _selectedItemIndex = 0;

  List<Widget> _pages = [
    HomeSplitBillFragment(),
    SearchSplitBillFragment(),
    PaymentSplitBillFragment(),
    ContactSplitBillFragment(),
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

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      backgroundColor: appStore.isDarkModeOn ? bottomNavBackgroundColor : Colors.white,
      type: BottomNavigationBarType.fixed,
      elevation: 40,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, ic_split_bill_home),
          activeIcon: customBottomNav(context, true, ic_split_bill_home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, ic_search),
          activeIcon: customBottomNav(context, true, ic_search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, ic_wallet),
          activeIcon: customBottomNav(context, true, ic_wallet),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: customBottomNav(context, false, ic_group),
          activeIcon: customBottomNav(context, true, ic_group),
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

  Widget customBottomNav(BuildContext context, bool isActiveIcon, String icon) {
    if (isActiveIcon) {
      return Image.asset(icon, height: 20, width: 20, color: appStore.isDarkModeOn ? primarySplitBillColor : primarySplitBillColor);
    } else {
      return Image.asset(icon, height: 16, width: 16, color: appStore.isDarkModeOn ? bottomNavBarColor : Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomTabBar(),
      body: _pages[_selectedItemIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: containerColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          //
        },
      ),
    );
  }
}
