import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/components/messages_component.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/components/utility_tracker_list_component.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/model/utility_tracker_model.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/utils/colors.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/utils/constant.dart';
import 'package:prokit_flutter/dashboard/utility_tracker/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class UtilityTrackerDashboard extends StatefulWidget {
  @override
  _UtilityTrackerDashboardState createState() => _UtilityTrackerDashboardState();
}

class _UtilityTrackerDashboardState extends State<UtilityTrackerDashboard> {
  List<UtilityTrackerModel> setUtilityTrackerData = getUtilityTrackerInfo();
  List<UtilityTrackerModel> setMessageData = getMessagesList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? Colors.black.withOpacity(0.5) : scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 78),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back',
                          style: secondaryTextStyle(color: appStore.isDarkModeOn ? null : utilitySecondaryTextColor),
                        ),
                        Text('${userData.userName}', style: boldTextStyle(size: 20)),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: radius(40),
                      child: Image.asset(img_user, height: 60, width: 60, fit: BoxFit.cover),
                    ),
                  ],
                ),
                20.height,
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? context.cardColor : containerColor,
                    borderRadius: radius(DEFAULT_UTILITY_RADIUS),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${userData.month}', style: secondaryTextStyle(color: appStore.isDarkModeOn ? null : Colors.grey)),
                          Text('Due in ${userData.days} days', style: secondaryTextStyle(color: appStore.isDarkModeOn ? null : Colors.grey)),
                        ],
                      ),
                      10.height,
                      Text('\u20AC ${userData.amount}', style: boldTextStyle(color: Colors.white, size: 24)),
                      30.height,
                      SizedBox(
                        width: context.width(),
                        child: AppButton(
                          text: 'Pay now',
                          textStyle: boldTextStyle(color: Colors.black),
                          color: primaryUtilityTrackerColor,
                          padding: EdgeInsets.all(10),
                          onTap: () {
                            //
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(setUtilityTrackerData.length, (index) {
                    UtilityTrackerModel utilityTrackerData = setUtilityTrackerData[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: radius(DEFAULT_UTILITY_RADIUS)),
                      child: UtilityTrackerListComponent(data: utilityTrackerData),
                    );
                  }),
                ),
                30.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Messages', style: boldTextStyle()),
                    Text('See all', style: secondaryTextStyle()),
                  ],
                ),
                16.height,
                Wrap(
                  spacing: 16,
                  direction: Axis.vertical,
                  children: List.generate(setMessageData.length, (index) {
                    UtilityTrackerModel messagesData = setMessageData[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 1 - 31,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
                      decoration: BoxDecoration(color: primaryUtilityTrackerColor, borderRadius: radius(10)),
                      child: MessagesComponent(messageData: messagesData),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appStore.isDarkModeOn ? Colors.white : containerColor,
          onPressed: () {
            //
          },
          child: Image.asset(ic_setting, height: 22, width: 22, color: appStore.isDarkModeOn ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
