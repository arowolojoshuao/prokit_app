import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/appetit/fragments/AHomeFragment.dart';
import 'package:prokit_flutter/fullApps/appetit/fragments/ANotificationFragment.dart';
import 'package:prokit_flutter/fullApps/appetit/fragments/AProfileFragment.dart';
import 'package:prokit_flutter/fullApps/appetit/fragments/ASearchFragment.dart';
import 'package:prokit_flutter/fullApps/appetit/screens/AAddRecipeScreen.dart';

class ADashboardScreen extends StatefulWidget {
  ADashboardScreen({Key? key}) : super(key: key);

  @override
  State<ADashboardScreen> createState() => _ADashboardScreenState();
}

class _ADashboardScreenState extends State<ADashboardScreen> {
  int selectedItem = 0;

  void onTapSelection(int index) {
    if (index == 2)
      Navigator.push(context, MaterialPageRoute(builder: (context) => AAddRecipeScreen()));
    else
      setState(() => selectedItem = index);
  }

  List<Widget> widgetOption = <Widget>[
    AHomeFragment(),
    ASearchFragment(),
    SizedBox(),
    ANotificationFragment(),
    AProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOption.elementAt(selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        backgroundColor: Color(0xFF462F4C),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedItem,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: onTapSelection,
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_outlined), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
