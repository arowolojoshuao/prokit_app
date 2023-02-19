import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EAForYouTabScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EATrendingTabScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';
import 'package:prokit_flutter/main.dart';

import 'EAFilterScreen.dart';

class EAHomeScreen extends StatefulWidget {
  final String? name;

  EAHomeScreen({this.name});

  @override
  EAHomeScreenState createState() => EAHomeScreenState();
}

class EAHomeScreenState extends State<EAHomeScreen> {
  final _kTabs = <Tab>[
    Tab(text: 'FOR YOU'),
    Tab(text: 'TRENDING'),
  ];

  final _kTabPages = <Widget>[
    EAForYouTabScreen(),
    EATrendingTabScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(widget.name != null ? "Plan in ${widget.name}" : "Plan in Your City"),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  width: context.width(),
                  child: Material(
                    color: context.cardColor,
                    child: TabBar(
                      tabs: _kTabs,
                      indicatorColor: primaryColor1,
                      labelColor: primaryColor1,
                      unselectedLabelColor: grey,
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: _kTabPages,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            margin: EdgeInsets.only(bottom: 16),
            decoration: boxDecorationRoundedWithShadow(
              20,
              backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Filter', style: primaryTextStyle()),
                8.width,
                Icon(SimpleLineIcons.equalizer, size: 16),
              ],
            ),
          ).onTap(
            () {
              EAFilterScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
            },
          )
        ],
      ),
    );
  }
}
