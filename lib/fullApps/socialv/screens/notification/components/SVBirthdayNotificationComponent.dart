import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVNotificationModel.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class SVBirthdayNotificationComponent extends StatelessWidget {
  final SVNotificationModel element;

  SVBirthdayNotificationComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(' and ${element.secondName}', style: secondaryTextStyle(color: svGetBodyColor())),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                6.height,
                Text('have their birthday on ${element.birthDate.validate()}',
                    style: secondaryTextStyle(
                      color: svGetBodyColor(),
                    )),
                6.height,
                Text('${element.time.validate()} ago', style: secondaryTextStyle(color: svGetBodyColor(), size: 12)),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(8)),
          child: Image.asset('images/socialv/icons/ic_Cake.png', height: 20, width: 20, fit: BoxFit.cover),
        ),
      ],
    ).paddingAll(16);
  }
}
