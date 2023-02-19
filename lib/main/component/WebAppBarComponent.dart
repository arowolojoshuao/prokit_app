import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/component/SoicalMediaWidgetComponent.dart';
import 'package:prokit_flutter/main/screens/WebSettingScreen.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';

class WebAppBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 100.milliseconds,
      decoration: boxDecorationDefault(
        color: context.cardColor,
        borderRadius: radius(0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Text(
            'ProKit Flutter Web',
            style: boldTextStyle(size: 20),
          ).expand(),
          SocialMediaWidgetComponent(),
          8.width,
          IconButton(
            icon: Icon(
              Icons.settings,
              color: appColorPrimary,
            ),
            onPressed: () {
              WebSettingScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
