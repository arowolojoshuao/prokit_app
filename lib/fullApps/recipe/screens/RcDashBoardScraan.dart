import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCHomeComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCProfileComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/components/RCSearchComponent.dart';
import 'package:prokit_flutter/fullApps/recipe/utils/RCColors.dart';
import 'package:prokit_flutter/main.dart';

class RcDashBoardScraan extends StatefulWidget {
  String name;

  RcDashBoardScraan({required this.name});

  @override
  _RcDashBoardScraanState createState() => _RcDashBoardScraanState();
}

class _RcDashBoardScraanState extends State<RcDashBoardScraan> {
  int selectedIndex = 0;

  Widget getTabs() {
    if (selectedIndex == 0) {
      return RCHomeComponent(name: widget.name);
    } else if (selectedIndex == 1) {
      return RCSearchScreen();
    } else if (selectedIndex == 2) {
      return RCProfileScreen();
    } else {
      return RCHomeComponent(name: widget.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: getTabs(),
      floatingActionButton: Material(
        elevation: 5,
        borderRadius: radius(24),
        child: Container(
          width: context.width() - 32,
          decoration: boxDecorationDefault(borderRadius: radius(24), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectedIndex == 0
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Home', style: boldTextStyle(color: primaryColor)),
                        4.height,
                        Icon(Icons.circle, size: 10, color: primaryColor),
                      ],
                    )
                  : IconButton(
                      onPressed: () {
                        selectedIndex = 0;
                        setState(() {});
                      },
                      icon: Icon(LineIcons.home, color: rcSecondaryTextColor, size: 30),
                    ),
              selectedIndex == 1
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Search', style: boldTextStyle(color: primaryColor)),
                        4.height,
                        Icon(Icons.circle, size: 10, color: primaryColor),
                      ],
                    )
                  : IconButton(
                      onPressed: () {
                        selectedIndex = 1;
                        setState(() {});
                      },
                      icon: Icon(LineIcons.search, color: rcSecondaryTextColor, size: 30),
                    ),
              selectedIndex == 2
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Profile', style: boldTextStyle(color: primaryColor)),
                        4.height,
                        Icon(Icons.circle, size: 10, color: primaryColor),
                      ],
                    )
                  : IconButton(
                      onPressed: () {
                        selectedIndex = 2;
                        setState(() {});
                      },
                      icon: Icon(LineIcons.user, color: rcSecondaryTextColor, size: 30),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
