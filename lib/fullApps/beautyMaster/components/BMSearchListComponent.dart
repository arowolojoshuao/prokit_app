import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/models/BMCommonCardModel.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMColors.dart';
import 'package:prokit_flutter/fullApps/beautyMaster/utils/BMCommonWidgets.dart';
import 'package:prokit_flutter/main.dart';

class BMSearchListComponent extends StatelessWidget {
  BMCommonCardModel element;

  BMSearchListComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(color: appStore.isDarkModeOn ? Colors.grey.withAlpha(70) : bmPrimaryColor.withAlpha(70), borderRadius: radius(100)),
          padding: EdgeInsets.all(8),
          child: Image.asset('images/beauty_master/magnifier.png', height: 24, color: appStore.isDarkModeOn ? Colors.white : bmPrimaryColor),
        ),
        16.width,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(title: element.title, size: 16),
            4.height,
            Text(
              element.subtitle!,
              style: secondaryTextStyle(color: appStore.isDarkModeOn ? bmTextColorDarkMode : bmPrimaryColor, size: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}
