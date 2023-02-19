import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class BMSocialIconsLoginComponents extends StatelessWidget {
  const BMSocialIconsLoginComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: [
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: facebook),
          child: SvgPicture.network(
            '$BaseUrl/images/beauty_master/ic_facebook.svg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: twitter),
          child: SvgPicture.network(
            '$BaseUrl/images/beauty_master/ic_twitter.svg',
            fit: BoxFit.cover,
          ),
        ),
        bmCommonCachedNetworkImage(
          '$BaseUrl/images/beauty_master/google_logo.png',
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ).cornerRadiusWithClipRRect(100),
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: radius(100), color: appStore.isDarkModeOn ? bmPrimaryColor : bmSpecialColorDark),
          child: bmCommonCachedNetworkImage(
            '$BaseUrl/images/beauty_master/ic_apple.png',
            color: white,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
