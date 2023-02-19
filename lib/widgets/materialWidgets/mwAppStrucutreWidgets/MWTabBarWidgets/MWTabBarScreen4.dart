import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class MWTabBarScreen4 extends StatefulWidget {
  static String tag = "/MWTabBarScreen4";

  @override
  _MWTabBarScreen4State createState() => _MWTabBarScreen4State();
}

class _MWTabBarScreen4State extends State<MWTabBarScreen4> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 19,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.appBarColor,
            iconTheme: IconThemeData(color: appStore.iconColor),
            title: Text(
              'Scrollable Tab',
              style: boldTextStyle(color: appStore.textPrimaryColor, size: 20),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              isScrollable: true,
              labelStyle: boldTextStyle(),
              indicatorColor: Colors.blue,
              unselectedLabelStyle: secondaryTextStyle(size: 16),
              tabs: [
                Tab(child: TabList(title: 'Home')),
                Tab(child: TabList(title: 'MarketPlace')),
                Tab(child: TabList(title: 'Group')),
                Tab(child: TabList(title: 'Watch')),
                Tab(child: TabList(title: 'Notifications')),
                Tab(child: TabList(title: 'Menu')),
                Tab(child: TabList(title: 'Profile')),
                Tab(child: TabList(title: 'Setting')),
                Tab(child: TabList(title: 'Message')),
                Tab(child: TabList(title: 'Call')),
                Tab(child: TabList(title: 'Library')),
                Tab(child: TabList(title: 'Category')),
                Tab(child: TabList(title: 'Cart')),
                Tab(child: TabList(title: 'Wishlist')),
                Tab(child: TabList(title: 'Order')),
                Tab(child: TabList(title: 'Report')),
                Tab(child: TabList(title: 'Favourite')),
                Tab(child: TabList(title: 'Wallet')),
                Tab(child: TabList(title: 'Settings')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              mTabContent("Home"),
              mTabContent("MarketPlace"),
              mTabContent("Group"),
              mTabContent("Watch"),
              mTabContent("Notifications"),
              mTabContent("Menu"),
              mTabContent("Profile"),
              mTabContent("Setting"),
              mTabContent("Message"),
              mTabContent("Call"),
              mTabContent("Library"),
              mTabContent("Category"),
              mTabContent("Cart"),
              mTabContent("Wishlist"),
              mTabContent("Order"),
              mTabContent("Report"),
              mTabContent("Favourite"),
              mTabContent("Wallet"),
              mTabContent("Settings"),
            ],
          ),
        ),
      ),
    );
  }

  Widget mTabContent(String title) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      width: context.width(),
      child: Text(title, style: primaryTextStyle(size: 24)),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TabList({Widget? icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon == null ? SizedBox() : icon,
        10.width,
        Text(
          title,
          style: TextStyle(color: appStore.textPrimaryColor),
        ),
      ],
    );
  }
}
