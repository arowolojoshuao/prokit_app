import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/components/LSBookingComponents.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';

class LSBookingFragment extends StatefulWidget {
  static String tag = '/LSBookingFragment';

  @override
  LSBookingFragmentState createState() => LSBookingFragmentState();
}

class LSBookingFragmentState extends State<LSBookingFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(context.cardColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: appBarWidget(
          'Bookings',
          center: true,
          showBack: false,
          color: context.cardColor,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: context.iconColor),
              onPressed: () {
                //
              },
            )
          ],
          bottom: TabBar(
            labelStyle: boldTextStyle(color: black, size: 18),
            unselectedLabelStyle: secondaryTextStyle(size: 16),
            labelColor: LSColorPrimary,
            unselectedLabelColor: appStore.isDarkModeOn ? white : black,
            isScrollable: false,
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('In Progress'),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Completed'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [LSBookingComponents(), LSBookingComponents()],
        ),
      ),
    );
  }
}
