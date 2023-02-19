import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAapp_widgets.dart';

import 'EATodayTicketScreen.dart';
import 'EATomorrowTicketScreen.dart';

class EATicketDetailScreen extends StatefulWidget {
  @override
  _EATicketDetailScreenState createState() => _EATicketDetailScreenState();
}

class _EATicketDetailScreenState extends State<EATicketDetailScreen> {
  List<Tab> ticketTabs = [];

  final ticketTabPages = <Widget>[
    EATodayTicketScreen(),
    EATomorrowTicketScreen(),
  ];

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    ticketTabs.add(Tab(text: "${DateFormat('EEE').format(DateTime(now.day))} ${DateFormat('d MMM').format(DateTime.now())}".toUpperCase()));
    ticketTabs.add(Tab(text: "${DateFormat('EEE').format(DateTime(now.day + 1))} {DateFormat('d MMM').format(DateTime.now().add(Duration(days: 1)))} ".toUpperCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        "Ticket Details",
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back, color: white),
        ),
        actions: [
          Text('Clear', style: primaryTextStyle(color: white)).paddingAll(16),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              width: context.width(),
              child: Material(
                color: context.cardColor,
                child: TabBar(
                  tabs: ticketTabs,
                  indicatorColor: primaryColor1,
                  labelColor: primaryColor1,
                  unselectedLabelColor: grey,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: ticketTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
