import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/fragments/BMAppointmentFragment.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMFavouritesScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMShoppingScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMBottomSheet.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class BMMoreFragment extends StatefulWidget {
  const BMMoreFragment({Key? key}) : super(key: key);

  @override
  State<BMMoreFragment> createState() => _BMMoreFragmentState();
}

class _BMMoreFragmentState extends State<BMMoreFragment> {
  @override
  void initState() {
    setStatusBarColor(bmSpecialColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          upperContainer(
            screenContext: context,
            child: Column(
              children: [
                16.height,
                bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/face_two.jpg', height: 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(100),
                8.height,
                Text('anita@gmail.com', style: boldTextStyle(color: white))
              ],
            ),
          ),
          lowerContainer(
            child: Column(
              children: [
                16.height,
                SettingItemWidget(
                  title: 'Check Appointments',
                  leading: Icon(Icons.calendar_today, color: bmPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(size: 20, color: appStore.isDarkModeOn ? white : bmSpecialColorDark),
                  onTap: () {
                    BMAppointmentFragment().launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Favourites',
                  leading: Icon(Icons.favorite, color: bmPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(size: 20, color: appStore.isDarkModeOn ? white : bmSpecialColorDark),
                  onTap: () {
                    BMFavouritesScreen().launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Orders',
                  leading: Icon(Icons.shopping_basket_rounded, color: bmPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(size: 20, color: appStore.isDarkModeOn ? white : bmSpecialColorDark),
                  onTap: () {
                    BMShoppingScreen(isOrders: true).launch(context);
                  },
                ),
                SettingItemWidget(
                  title: 'Contact Us',
                  leading: Icon(Icons.call, color: bmPrimaryColor, size: 30),
                  titleTextStyle: boldTextStyle(size: 20, color: appStore.isDarkModeOn ? white : bmSpecialColorDark),
                  onTap: () {
                    showSelectStaffBottomSheet(context);
                  },
                )
              ],
            ),
            screenContext: context,
          )
        ],
      ),
    );
  }
}
