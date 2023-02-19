import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/fragments/LSBookingFragment.dart';
import 'package:prokit_flutter/fullApps/laundryService/fragments/LSHomeFragment.dart';
import 'package:prokit_flutter/fullApps/laundryService/fragments/LSNearByFragment.dart';
import 'package:prokit_flutter/fullApps/laundryService/fragments/LSOfferFragment.dart';
import 'package:prokit_flutter/fullApps/laundryService/fragments/LSProfileFragment.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';

class LSOnBoardingScreen extends StatefulWidget {
  static String tag = '/LSOnBoardingScreen';

  @override
  LSOnBoardingScreenState createState() => LSOnBoardingScreenState();
}

class LSOnBoardingScreenState extends State<LSOnBoardingScreen> {
  int selectedIndex = 0;

  List<Widget> viewContainer = [];

  LSHomeFragment homeFragment = LSHomeFragment();
  LSNearByFragment nearByFragment = LSNearByFragment();
  LSBookingFragment bookingFragment = LSBookingFragment();
  LSOfferFragment offerFragment = LSOfferFragment();
  LSProfileFragment profileFragment = LSProfileFragment();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    viewContainer = [
      homeFragment,
      nearByFragment,
      bookingFragment,
      offerFragment,
      profileFragment,
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: viewContainer[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: context.scaffoldBackgroundColor, offset: Offset.fromDirection(3, 1), spreadRadius: 1, blurRadius: 5),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSHome, fit: BoxFit.fitHeight, color: lightGrey, height: 24, width: 24),
              activeIcon: SvgPicture.asset(LSHome, color: LSColorPrimary, height: 24, width: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSPin, fit: BoxFit.fitHeight, color: lightGrey, height: 24, width: 24),
              activeIcon: SvgPicture.asset(LSPin, color: LSColorPrimary, height: 24, width: 24),
              label: 'NearBy',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSBasket, fit: BoxFit.fitHeight, color: lightGrey, height: 24, width: 24),
              activeIcon: SvgPicture.asset(LSBasket, color: LSColorPrimary, height: 24, width: 24),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSSale, fit: BoxFit.fitHeight, color: lightGrey, height: 24, width: 24),
              activeIcon: SvgPicture.asset(LSSale, color: LSColorPrimary, height: 24, width: 24),
              label: 'Offers',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(LSUser, fit: BoxFit.fitHeight, color: lightGrey, height: 24, width: 24),
              activeIcon: SvgPicture.asset(LSUser, color: LSColorPrimary, height: 24, width: 24),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(color: lightGrey, size: 24),
          selectedIconTheme: IconThemeData(color: LSColorPrimary, size: 24),
          selectedLabelStyle: TextStyle(color: LSColorPrimary),
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
