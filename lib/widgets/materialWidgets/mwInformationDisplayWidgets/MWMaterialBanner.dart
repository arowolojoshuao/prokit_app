import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class MWMaterialBanner extends StatefulWidget {
  static String tag = '/MWMaterialBanner';

  @override
  MWMaterialBannerState createState() => MWMaterialBannerState();
}

class MWMaterialBannerState extends State<MWMaterialBanner> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

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
    return WillPopScope(
      onWillPop: () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner(reason: MaterialBannerClosedReason.remove);
        return Future.value(true);
      },
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appStore.appBarColor,
          leading: IconButton(
            onPressed: () {
              finish(context);
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            icon: Icon(Icons.arrow_back, color: appStore.iconColor),
          ),
          title: appBarTitleWidget(context, "Material Banner"),
        ),
        body: AppButton(
          text: 'Show Material Banner',
          color: appColorPrimary,
          textColor: Colors.white,
          onTap: () {
            ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
              padding: EdgeInsets.all(20),
              leading: Icon(Icons.info_outline, color: Colors.white),
              backgroundColor: appStore.isDarkModeOn ? appStore.appBarColor : appColorPrimary,
              content: Text('Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                  style: primaryTextStyle(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel', style: secondaryTextStyle(size: 16, color: Colors.white.withOpacity(0.5))),
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                ),
                TextButton(
                  child: Text('Done', style: primaryTextStyle(color: Colors.white)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  },
                ),
              ],
            ));
          },
        ).center(),
      ),
    );
  }
}
