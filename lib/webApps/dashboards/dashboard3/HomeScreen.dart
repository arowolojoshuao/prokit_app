import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/MainMobileComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/MainTabletComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/components/MainWebComponent.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';

class Dashboard3HomeScreen extends StatefulWidget {
  const Dashboard3HomeScreen({Key? key}) : super(key: key);

  @override
  _Dashboard3HomeScreenState createState() => _Dashboard3HomeScreenState();
}

class _Dashboard3HomeScreenState extends State<Dashboard3HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Responsive(
        web: MainWebComponent(),
        tablet: MainTabletComponent(),
        mobile: MainMobileComponent(),
      ),
    );
  }
}
