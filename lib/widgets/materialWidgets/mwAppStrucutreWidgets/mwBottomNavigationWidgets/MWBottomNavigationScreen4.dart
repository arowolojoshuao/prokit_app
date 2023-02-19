import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWBottomNavigationScreen4 extends StatefulWidget {
  const MWBottomNavigationScreen4({Key? key}) : super(key: key);

  @override
  _MWBottomNavigationScreen4State createState() => _MWBottomNavigationScreen4State();
}

class _MWBottomNavigationScreen4State extends State<MWBottomNavigationScreen4> {
  List<IconData> navbarIcons = [
    Icons.home,
    Icons.search,
    Icons.add_box,
    Icons.favorite,
    Icons.account_circle,
  ];

  List widgets = <Widget>[
    Center(child: Text("Home View", style: boldTextStyle(size: 24))),
    Center(child: Text("Search View", style: boldTextStyle(size: 24))),
    Center(child: Text("Gallery View", style: boldTextStyle(size: 24))),
    Center(child: Text("Favorite View", style: boldTextStyle(size: 24))),
    Center(child: Text("Profile View", style: boldTextStyle(size: 24))),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: widgets[selectedIndex],
      bottomNavigationBar: Container(
        decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
        padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navbarIcons.map(
            (e) {
              int i = navbarIcons.indexOf(e);
              return AnimatedContainer(
                duration: Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  gradient: i == selectedIndex
                      ? LinearGradient(
                          colors: appStore.isDarkModeOn ? [Colors.blue.shade800, context.cardColor] : [Colors.blue.shade100, white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 45,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: radiusOnly(bottomLeft: 5, bottomRight: 5),
                      ),
                    ).visible(i == selectedIndex),
                    IconButton(
                      icon: Icon(
                        e,
                        size: 30,
                        color: i == selectedIndex ? Colors.blue : Colors.blueGrey[300],
                      ),
                      onPressed: () {
                        selectedIndex = i;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
