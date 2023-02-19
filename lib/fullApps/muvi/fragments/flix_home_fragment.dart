import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/muvi/fragments/flix_sub_home_fragment.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_app_widgets.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/flix_constants.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_colors.dart';
import 'package:prokit_flutter/fullApps/muvi/utils/resources/flix_size.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class HomeFragment extends StatefulWidget {
  static String tag = '/HomeFragment';

  @override
  HomeFragmentState createState() => HomeFragmentState();
}

class HomeFragmentState extends State<HomeFragment> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(muvi_appBackground);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: muvi_appBackground,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          backgroundColor: muvi_navigationBackground,
          centerTitle: false,
          title: flixTitle(context),
          actions: [notificationIcon(context, 2)],
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 45),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                indicatorWeight: 3.0,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(fontFamily: font_medium, fontSize: ts_normal),
                indicatorColor: muvi_colorPrimary,
                unselectedLabelColor: muvi_textColorPrimary,
                labelColor: muvi_colorPrimary,
                labelPadding: EdgeInsets.only(left: spacing_large, right: spacing_large),
                tabs: [
                  Tab(child: Text("Featured")),
                  Tab(child: Text("Series")),
                  Tab(child: Text("Films")),
                  Tab(child: Text("Originals")),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            HomeCategoryFragment(type: "Featured"),
            HomeCategoryFragment(type: "Featured"),
            HomeCategoryFragment(type: "Featured"),
            HomeCategoryFragment(type: "Featured"),
          ],
        ),
      ),
    );
  }
}
