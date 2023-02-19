import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWNavigationRailScreen1 extends StatefulWidget {
  const MWNavigationRailScreen1({Key? key}) : super(key: key);

  @override
  _MWNavigationRailScreen1State createState() => _MWNavigationRailScreen1State();
}

class _MWNavigationRailScreen1State extends State<MWNavigationRailScreen1> {
  List widgets = <Widget>[
    Center(child: Text("Home View", style: boldTextStyle(size: 24))),
    Center(child: Text("Profile View", style: boldTextStyle(size: 24))),
    Center(child: Text("Notifications View", style: boldTextStyle(size: 24))),
    Center(child: Text("Stats View", style: boldTextStyle(size: 24))),
    Center(child: Text("Schedule View", style: boldTextStyle(size: 24))),
    Center(child: Text("Settings View", style: boldTextStyle(size: 24))),
  ];

  int _selectedIndex = 0;
  String title = 'D4screen';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              extended: isExpanded,
              onDestinationSelected: (int index) {
                _selectedIndex = index;
                setState(() {});
              },
              trailing: IconButton(
                icon: Icon(isExpanded ? Icons.arrow_back_ios_rounded : Icons.arrow_forward_ios, color: Colors.blue),
                onPressed: () {
                  isExpanded = !isExpanded;
                  setState(() {});
                },
              ).paddingTop(64),
              leading: AnimatedContainer(
                duration: 400.milliseconds,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle, size: 50, color: context.iconColor),
                    Text('Rebeca Babara', style: boldTextStyle(size: 20)).visible(isExpanded),
                    Text('Designer', style: secondaryTextStyle()).visible(isExpanded),
                  ],
                ),
              ),
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.home, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.account_box_rounded),
                  label: Text('Profile', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.account_box_rounded, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.notifications_none),
                  label: Text('Notifications', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.notifications_none, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.stacked_bar_chart),
                  label: Text('Stats', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.stacked_bar_chart, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.access_time),
                  label: Text('Schedule', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.access_time, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text('Settings', style: primaryTextStyle()),
                  selectedIcon: Icon(Icons.settings, color: Colors.blue),
                  padding: EdgeInsets.all(0),
                ),
              ],
            ),
            VerticalDivider(width: 0),
            Expanded(
              child: widgets[_selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
