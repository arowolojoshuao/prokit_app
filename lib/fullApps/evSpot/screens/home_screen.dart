import 'package:prokit_flutter/fullApps/evSpot/components/app_drawer_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/components/app_logo_image_component.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/images.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/apply_filter_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/enroute_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/favorite_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/screens/nearby_screen.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItemIndex = 0;

  List<Widget> widgetArray = [
    NearbyScreen(),
    EnrouteScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          backgroundColor: _selectedItemIndex == 2
              ? appStore.isDarkModeOn
                  ? Colors.black
                  : backgroundColor
              : appStore.isDarkModeOn
                  ? Colors.black
                  : Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: _selectedItemIndex == 2
                ? appStore.isDarkModeOn
                    ? Colors.black
                    : backgroundColor
                : appStore.isDarkModeOn
                    ? Colors.black
                    : Colors.white,
            statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
          ),
          title: AppLogoImageComponent(isCenter: true),
          actions: [
            IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApplyFilterScreen()));
              },
              icon: Image.asset(ic_filter, height: 22, width: 22, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            ),
          ],
        ),
        drawer: AppDrawerComponent(),
        body: widgetArray[_selectedItemIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: appStore.isDarkModeOn ? [Colors.black, Colors.black] : [Colors.white, Colors.white12],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: customBottomNav(context, false, 'NEARBY', Icons.location_on),
                activeIcon: customBottomNav(context, true, 'NEARBY', Icons.location_on),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: customBottomNav(context, false, 'ENROUTE', Icons.navigation),
                activeIcon: customBottomNav(context, true, 'ENROUTE', Icons.navigation),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: customBottomNav(context, false, 'FAVORITE', Icons.favorite),
                activeIcon: customBottomNav(context, true, 'FAVORITE', Icons.favorite),
                label: '',
              ),
            ],
            currentIndex: _selectedItemIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int newIndex) {
              setState(() {
                _selectedItemIndex = newIndex;
              });
            },
            selectedItemColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
            unselectedItemColor: appStore.isDarkModeOn ? textPrimaryDarkColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget customBottomNav(BuildContext context, bool isActiveIcon, String text, IconData icon) {
    if (isActiveIcon) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18),
              SizedBox(width: 5),
              Text('$text', style: boldTextStyle()),
            ],
          ),
          SizedBox(height: 4),
          Container(width: 30, height: 4, decoration: BoxDecoration(color: ev_primary_color, borderRadius: BorderRadius.circular(5)))
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          SizedBox(width: 5),
          Text('$text', style: boldTextStyle(color: appStore.isDarkModeOn ? textPrimaryDarkColor : Colors.grey)),
        ],
      );
    }
  }
}
