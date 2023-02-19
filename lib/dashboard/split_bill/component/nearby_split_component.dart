import 'package:flutter/material.dart';
import 'package:prokit_flutter/dashboard/split_bill/model/split_bill_info_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/colors.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/images.dart';
import 'package:prokit_flutter/main.dart';

class NearbySplitComponent extends StatelessWidget {
  const NearbySplitComponent({
    Key? key,
    required this.splitNearbyFriendsInfo,
    required this.recentSplitIconInfo,
    required this.recentSplitInfo,
  }) : super(key: key);

  final List<SplitBillInfoModel> splitNearbyFriendsInfo;
  final List<SplitBillInfoModel> recentSplitIconInfo;
  final List<SplitBillInfoModel> recentSplitInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nearby Friends', style: boldTextStyle(size: 17)),
              Row(
                children: [
                  Text('See all', style: secondaryTextStyle()),
                  Icon(Icons.keyboard_arrow_down, color: customLightGreyColor, size: 20),
                ],
              ),
            ],
          ),
        ),
        20.height,
        HorizontalList(
          spacing: 16,
          padding: EdgeInsets.only(left: 16, right: 16),
          itemCount: splitNearbyFriendsInfo.length,
          itemBuilder: (context, index) {
            SplitBillInfoModel nearbyFriendData = splitNearbyFriendsInfo[index];
            return Container(
              width: MediaQuery.of(context).size.width / 4 - 28,
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 18),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? bottomNavBackgroundColor : primarySplitBillColor.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.elliptical(120, 100)),
              ),
              child: Column(
                children: [
                  10.height,
                  Container(
                    decoration: BoxDecoration(borderRadius: radius(40), color: nearbyFriendData.iconBgColor),
                    padding: EdgeInsets.all(8),
                    child: Image.asset(nearbyFriendData.icon!, height: 30, width: 30, fit: BoxFit.fitWidth),
                  ),
                  10.height,
                  Text('${nearbyFriendData.name}', style: primaryTextStyle()),
                ],
              ),
            );
          },
        ),
        10.height,
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recent Split', style: boldTextStyle(size: 17, color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
              10.height,
              ...List.generate(
                5,
                (index) {
                  SplitBillInfoModel recentSplitData = recentSplitInfo[index % recentSplitInfo.length];
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? bottomNavBackgroundColor : primarySplitBillColor.withOpacity(0.5),
                      borderRadius: radius(10),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 16,
                      title: Text('${recentSplitData.recentSplitTitle}', style: boldTextStyle()),
                      subtitle: RichText(
                        text: TextSpan(
                          text: 'Total payment ',
                          style: secondaryTextStyle(size: 12),
                          children: [
                            TextSpan(text: '\$${recentSplitData.recentSplitSubTitleAmount}', style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? containerColor : Colors.white,
                          borderRadius: radius(10),
                        ),
                        child: Image.asset(ic_group, height: 24, width: 24, color: primarySplitBillColor),
                      ),
                      trailing: Stack(
                        clipBehavior: Clip.none,
                        children: List.generate(recentSplitIconInfo.length, (index) {
                          SplitBillInfoModel recentSplitIconData = recentSplitIconInfo[index];
                          return Container(
                            margin: EdgeInsets.only(left: (index * 18)),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(color: recentSplitIconData.iconBgColor, shape: BoxShape.circle),
                            child: Image.asset(recentSplitIconData.recentSplitTrailingIcon!, height: 22, width: 22),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
