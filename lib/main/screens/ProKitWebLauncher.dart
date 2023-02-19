import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/component/WebComponent.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppDataProvider.dart';

class ProKitWebLauncher extends StatefulWidget {
  static String tag = '/ProKitWebLauncher';

  @override
  ProKitWebLauncherState createState() => ProKitWebLauncherState();
}

class ProKitWebLauncherState extends State<ProKitWebLauncher> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AppTheme>(
        future: getAllAppsAndThemes(),
        builder: (_, snap) {
          if (snap.hasData) {
            return WebComponent(appTheme: snap.data!);
          }
          return snapWidgetHelper(snap);
        },
      ),
    );
  }
}
