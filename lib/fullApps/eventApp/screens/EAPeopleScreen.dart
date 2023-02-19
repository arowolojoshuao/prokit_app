import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EAExplorerScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/screens/EASearchPeopleScreen.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

import 'EAMayBEYouKnowScreen.dart';

class EAPeopleScreen extends StatefulWidget {
  @override
  EAPeopleScreenState createState() => EAPeopleScreenState();
}

class EAPeopleScreenState extends State<EAPeopleScreen> {
  final _kTabs = <Tab>[
    Tab(text: "MAYBE YOU KNOW"),
    Tab(text: 'EXPLORER'),
  ];

  final _kTabPages = [
    EAMayBEYouKnowScreen(),
    EAExplorerScreen(),
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
      appBar: getAppBar(
        "People",
        center: true,
        actions: [
          IconButton(
              onPressed: () {
                EASearchPeopleScreen().launch(context);
              },
              icon: Icon(Icons.search, color: white))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
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
                  child: TabBarView(physics: BouncingScrollPhysics(), children: _kTabPages),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
