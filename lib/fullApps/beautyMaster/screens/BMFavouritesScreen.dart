import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/components/BMCommonCardComponent.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMConstants.dart';
import 'package:prokit_flutter/main.dart';

class BMFavouritesScreen extends StatefulWidget {
  const BMFavouritesScreen({Key? key}) : super(key: key);

  @override
  _BMFavouritesScreenState createState() => _BMFavouritesScreenState();
}

class _BMFavouritesScreenState extends State<BMFavouritesScreen> {
  @override
  void initState() {
    setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(bmSpecialColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30, color: bmPrimaryColor),
          onPressed: () {
            finish(context);
          },
        ),
        title: titleText(title: 'Favourites'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: favList.map((e) {
            return BMCommonCardComponent(fullScreenComponent: true, element: e, isFavList: true).paddingSymmetric(vertical: 10);
          }).toList(),
        ).paddingOnly(top: 16, bottom: 70, left: 16, right: 16),
      ),
    );
  }
}
