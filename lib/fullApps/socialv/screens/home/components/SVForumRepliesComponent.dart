import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/socialv/models/SVForumRepliesModel.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVColors.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVCommon.dart';
import 'package:prokit_flutter/fullApps/socialv/utils/SVConstants.dart';

class SVForumRepliesComponent extends StatelessWidget {
  final List<SVForumRepliesModel> repliesList = getRepliesList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(SVAppCommonRadius)),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('images/socialv/icons/ic_Calendar.png', height: 16, width: 16, fit: BoxFit.cover, color: context.iconColor),
                8.width,
                Text(repliesList[index].date.validate(), style: secondaryTextStyle(color: svGetBodyColor(), weight: FontWeight.w600)).expand(),
                Text('#${repliesList[index].hashTagNo.validate()}', style: secondaryTextStyle(color: SVAppColorPrimary, weight: FontWeight.w700)),
              ],
            ),
            Divider(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    svCommonCachedNetworkImage(
                      repliesList[index].profileImage.validate(),
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRect(8),
                    20.width,
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(repliesList[index].name.validate(), style: boldTextStyle()),
                            6.width,
                            repliesList[index].isOfficial.validate() ? Image.asset('images/socialv/icons/ic_TickSquare.png', height: 14, width: 14, fit: BoxFit.cover) : Offstage(),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                        6.height,
                        Text(repliesList[index].subTitle.validate(), style: secondaryTextStyle(color: svGetBodyColor())),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: SVAppColorPrimary.withAlpha(30), borderRadius: radius(SVAppContainerRadius)),
                  child: Text('Keymaster', style: boldTextStyle(size: 14, color: SVAppColorPrimary)),
                )
              ],
            ),
            24.height,
            Text(repliesList[index].description.validate(), style: secondaryTextStyle(color: svGetBodyColor()))
          ],
        ),
      ),
      itemCount: repliesList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}
