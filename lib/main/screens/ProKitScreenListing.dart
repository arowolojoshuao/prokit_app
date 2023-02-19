import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../main.dart';
import 'ThemeList.dart';

class ProKitScreenListing extends StatefulWidget {
  static String tag = "/ProKitScreenListing";
  final ProTheme? proTheme;

  ProKitScreenListing(this.proTheme);

  @override
  ProKitScreenListingState createState() => ProKitScreenListingState();
}

class ProKitScreenListingState extends State<ProKitScreenListing> {
  var selectedTab = 0;
  List<ProTheme> list = [];

  BannerAd? myBanner;

  @override
  void initState() {
    super.initState();
    if (widget.proTheme!.sub_kits != null) {
      list.addAll(widget.proTheme!.sub_kits!);
    }

    afterBuildCreated(() {
      changeStatusColor(appStore.scaffoldBackground!);
    });
  }

  @override
  void dispose() {
    myBanner?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(
          context,
          widget.proTheme!.name ?? widget.proTheme!.name!,
          iconColor: Theme.of(context).iconTheme.color,
          actions: [
            Tooltip(
              message: 'Dark Mode',
              child: Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  appStore.toggleDarkMode(value: s);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16),
                    child: widget.proTheme!.show_cover! ? Image.asset(app_bg_cover_image, height: context.height() / 4) : null,
                  ),
                  ThemeList(list),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
