import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

import 'EAFollowersScreen.dart';
import 'EAFollowingScreen.dart';

class EAConnectionScreen extends StatefulWidget {
  final int? ind;

  EAConnectionScreen({this.ind});

  @override
  _EAConnectionScreenState createState() => _EAConnectionScreenState();
}

class _EAConnectionScreenState extends State<EAConnectionScreen> {
  final connectionTabs = <Tab>[
    Tab(text: "FolLowers".toUpperCase()),
    Tab(text: "Following".toUpperCase()),
  ];
  final connectionTabPages = <Widget>[EAFollowersScreen(), EAFollowingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Connections",
          backWidget: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: Icon(Icons.arrow_back, color: white))),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: context.width(),
              child: Material(
                color: context.cardColor,
                child: TabBar(
                  tabs: connectionTabs,
                  indicatorColor: primaryColor1,
                  labelColor: primaryColor1,
                  unselectedLabelColor: grey,
                  unselectedLabelStyle: TextStyle(color: redColor),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: connectionTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
