import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVNotificationModel.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVNewPostNotificationComponent extends StatelessWidget {
  final SVNotificationModel element;

  SVNewPostNotificationComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svCommonCachedNetworkImage(element.profileImage.validate(), height: 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
        8.width,
        Column(
          children: [
            Row(
              children: [
                Text(element.name.validate(), style: boldTextStyle(size: 14)),
                2.width,
                element.isOfficial.validate() ? Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover) : Offstage(),
                Text(' Posted new post', style: secondaryTextStyle(color: svGetBodyColor())),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
            6.height,
            Text('${element.time.validate()} ago', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ).expand(),
        svCommonCachedNetworkImage(element.postImage.validate(), height: 48, width: 48, fit: BoxFit.cover).cornerRadiusWithClipRRect(4),
      ],
    ).paddingAll(16);
  }
}
