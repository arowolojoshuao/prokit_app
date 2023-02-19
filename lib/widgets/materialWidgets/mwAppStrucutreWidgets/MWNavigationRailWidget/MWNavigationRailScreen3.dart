import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWNavigationRailScreen3 extends StatefulWidget {
  const MWNavigationRailScreen3({Key? key}) : super(key: key);

  @override
  _MWNavigationRailScreen3State createState() => _MWNavigationRailScreen3State();
}

class _MWNavigationRailScreen3State extends State<MWNavigationRailScreen3> {
  List widgets = <Widget>[
    Center(child: Text("Popular View", style: boldTextStyle(size: 24))),
    Center(child: Text("Favorites View", style: boldTextStyle(size: 24))),
    Center(child: Text("Inspiration View", style: boldTextStyle(size: 24))),
    Center(child: Text("All View", style: boldTextStyle(size: 24))),
  ];

  int _selectedIndex = 3;

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
        body: Row(
          children: [
            NavigationRail(
              selectedLabelTextStyle: TextStyle(color: Colors.white),
              unselectedLabelTextStyle: TextStyle(color: Colors.white54),
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Colors.blueGrey,
              onDestinationSelected: (int index) {
                _selectedIndex = index;
                setState(() {});
              },
              groupAlignment: 0.9,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Popular", style: primaryTextStyle(color: Colors.white, decoration: _selectedIndex == 0 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Favorites", style: primaryTextStyle(color: Colors.white, decoration: _selectedIndex == 1 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("Inspiration", style: primaryTextStyle(color: Colors.white, decoration: _selectedIndex == 2 ? TextDecoration.underline : TextDecoration.none)),
                  ),
                ),
                NavigationRailDestination(
                  icon: SizedBox.shrink(),
                  label: RotatedBox(
                    quarterTurns: -1,
                    child: Text("All", style: primaryTextStyle(color: Colors.white, decoration: _selectedIndex == 3 ? TextDecoration.underline : TextDecoration.none)),
                  ),
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
