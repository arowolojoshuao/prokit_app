import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWNavigationRailScreen2 extends StatefulWidget {
  const MWNavigationRailScreen2({Key? key}) : super(key: key);

  @override
  _MWNavigationRailScreen2State createState() => _MWNavigationRailScreen2State();
}

class _MWNavigationRailScreen2State extends State<MWNavigationRailScreen2> {
  int _selectedIndex = 0;

  List widgets = <Widget>[
    Center(child: Text("Home View", style: boldTextStyle(size: 24))),
    Center(child: Text("Profile View", style: boldTextStyle(size: 24))),
    Center(child: Text("Schedule View", style: boldTextStyle(size: 24))),
    Center(child: Text("Settings View", style: boldTextStyle(size: 24))),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  backgroundColor: Colors.teal,
                  labelType: NavigationRailLabelType.all,
                  selectedLabelTextStyle: primaryTextStyle(color: Colors.white),
                  unselectedLabelTextStyle: secondaryTextStyle(color: Colors.white),
                  groupAlignment: 0.0,
                  onDestinationSelected: (int index) {
                    _selectedIndex = index;
                    setState(() {});
                  },
                  destinations: <NavigationRailDestination>[
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Text('Home').paddingSymmetric(horizontal: 4),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.account_box, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Text('Profile').paddingSymmetric(horizontal: 4),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(Icons.access_time, color: Colors.white),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Text('Schedule').paddingSymmetric(horizontal: 4),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: SizedBox.shrink(),
                      selectedIcon: RotatedBox(
                        quarterTurns: -1,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      label: RotatedBox(
                        quarterTurns: -1,
                        child: Text('Settings').paddingSymmetric(horizontal: 4),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: widgets[_selectedIndex],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
