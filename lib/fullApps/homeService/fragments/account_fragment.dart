import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/homeService/fragments/bookings_fragment.dart';
import 'package:prokit_flutter/fullApps/homeService/models/customer_details_model.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/favourite_services_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/my_profile_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/screens/notification_screen.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/colors.dart';
import 'package:prokit_flutter/fullApps/homeService/utils/images.dart';
import 'package:prokit_flutter/main.dart';

import '../custom_widget/space.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({Key? key}) : super(key: key);

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          "Account",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: appStore.isDarkModeOn ? white : black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90, width: 90, child: CircleAvatar(backgroundImage: AssetImage(userImage))),
            Space(8),
            Text(getName, textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            Space(4),
            Text(getEmail, textAlign: TextAlign.start, style: TextStyle(color: secondaryColor, fontSize: 12)),
            Space(16),
            ListTile(
              horizontalTitleGap: 4,
              leading: Icon(Icons.person, size: 20),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text("My Profile"),
              trailing: Icon(Icons.edit, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.favorite, size: 20),
              title: Text("My Favourites", style: TextStyle()),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteProvidersScreen()));
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.notifications, size: 20),
              title: Text("Notifications"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.calendar_month, size: 20),
              title: Text("My bookings"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingsFragment(fromProfile: true)));
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.paid_rounded, size: 20),
              title: Text("Refer and earn"),
              onTap: () {
                //
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.mail, size: 20),
              title: Text("Contact Us"),
              onTap: () {
                //
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.question_mark, size: 20),
              title: Text("Help Center"),
              onTap: () {
                //
              },
            ),
            ListTile(
              horizontalTitleGap: 4,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(Icons.local_offer, size: 20),
              title: Text("Offers And Coupons"),
              onTap: () {
                //
              },
            ),
            Space(16),
          ],
        ),
      ),
    );
  }
}
