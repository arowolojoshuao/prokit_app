import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/screens/BMDashboardScreen.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';

class BMWelcomeScreen extends StatelessWidget {
  const BMWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bmCommonCachedNetworkImage('$BaseUrl/images/beauty_master/welcome.png', height: 200),
          Text('Welcome to Beauty Master!', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark, size: 24)),
          16.height,
          Text(
            'Find the best beauty salon in your local abd book the dream visit.',
            style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : bmSpecialColorDark),
            textAlign: TextAlign.center,
          ),
          16.height,
          AppButton(
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: Text('Let\'s Start', style: boldTextStyle(color: Colors.white)),
            padding: EdgeInsets.all(16),
            width: 150,
            color: bmPrimaryColor,
            onTap: () {
              BMDashboardScreen(flag: true).launch(context);
            },
          ),
        ],
      ).paddingAll(20),
    );
  }
}
