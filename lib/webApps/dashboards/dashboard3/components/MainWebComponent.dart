import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/screens/MyDrawer.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/screens/RecentOrderView.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/screens/SalesView.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';

class MainWebComponent extends StatefulWidget {
  @override
  MainWebComponentState createState() => MainWebComponentState();
}

class MainWebComponentState extends State<MainWebComponent> {
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
      backgroundColor: secondaryColor,
      body: Row(
        children: [
          Drawer(elevation: 0, child: MyDrawer()).expand(flex: 2),
          8.width,
          SalesView().expand(flex: 5),
          8.width,
          RecentOrderView().expand(flex: 2),
        ],
      ).paddingAll(8),
    );
  }
}
