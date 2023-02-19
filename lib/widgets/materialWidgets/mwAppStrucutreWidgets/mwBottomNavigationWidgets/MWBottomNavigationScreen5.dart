import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class MWBottomNavigationScreen5 extends StatefulWidget {
  const MWBottomNavigationScreen5({Key? key}) : super(key: key);

  @override
  _MWBottomNavigationScreen5State createState() => _MWBottomNavigationScreen5State();
}

class _MWBottomNavigationScreen5State extends State<MWBottomNavigationScreen5> {
  List<IconData> navbarIcons = [Icons.home, Icons.search, Icons.add_box, Icons.favorite, Icons.account_circle];
  List widgets = <Widget>[
    Center(child: Text("Home View", style: boldTextStyle(size: 24))),
    Center(child: Text("Search View", style: boldTextStyle(size: 24))),
    Center(child: Text("Gallery View", style: boldTextStyle(size: 24))),
    Center(child: Text("Favorite View", style: boldTextStyle(size: 24))),
    Center(child: Text("Profile View", style: boldTextStyle(size: 24))),
  ];

  List<String> bottomNavigationName = ['Home', 'Search', 'Gallery', 'Favorite', 'Profile'];

  List<Color> color = [Colors.blue, Colors.orange, Colors.purple, Colors.red, Colors.green];

  List<Color> colorShade = [Colors.blue.shade100, Colors.orange.shade100, Colors.purple.shade100, Colors.red.shade100, Colors.green.shade100];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ''),
      body: widgets[selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 16, left: 12, right: 12, top: 8),
        height: 70,
        decoration: boxDecorationDefault(borderRadius: radius(0), color: context.cardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navbarIcons.map(
            (e) {
              int i = navbarIcons.indexOf(e);
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(8),
                height: 45,
                decoration: BoxDecoration(
                  color: i == selectedIndex ? colorShade[i] : context.cardColor,
                  borderRadius: radius(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      e,
                      size: 30,
                      color: i == selectedIndex ? color[i] : Colors.blueGrey[300],
                    ).onTap(
                      () {
                        selectedIndex = i;
                        setState(() {});
                      },
                      splashColor: context.cardColor,
                    ),
                    Text(bottomNavigationName[i], style: boldTextStyle(color: color[i])).paddingSymmetric(horizontal: 4).visible(i == selectedIndex),
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
