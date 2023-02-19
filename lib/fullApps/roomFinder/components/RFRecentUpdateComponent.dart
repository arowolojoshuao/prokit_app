import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFHotelDescriptionScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';

class RFRecentUpdateComponent extends StatelessWidget {
  final RoomFinderModel recentUpdateData;

  RFRecentUpdateComponent({required this.recentUpdateData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          rfCommonCachedNetworkImage(recentUpdateData.img.validate(), width: context.width(), height: 150, fit: BoxFit.cover),
          12.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(recentUpdateData.roomCategoryName.validate(), style: boldTextStyle()).paddingOnly(left: 4),
              Row(
                children: [
                  Text(recentUpdateData.price.validate(), style: boldTextStyle(color: rf_primaryColor)),
                  Text("${recentUpdateData.rentDuration.validate()}", style: secondaryTextStyle()),
                ],
              ),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: rf_primaryColor, size: 16),
                  8.width,
                  Text(recentUpdateData.location.validate(), style: secondaryTextStyle()),
                ],
              ),
              Row(
                children: [
                  Text(recentUpdateData.description.validate(), style: secondaryTextStyle()),
                  Text(recentUpdateData.views.validate(), style: secondaryTextStyle()),
                ],
              ),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              2.width,
              Container(
                decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: recentUpdateData.color ?? greenColor),
                padding: EdgeInsets.all(4),
              ),
              11.width,
              Text(recentUpdateData.address.validate(), style: secondaryTextStyle()),
            ],
          ).paddingOnly(left: 2),
        ],
      ),
    ).onTap(() {
      RFHotelDescriptionScreen(hotelData: recentUpdateData).launch(context);
    }, splashColor: Colors.transparent, hoverColor: Colors.transparent, highlightColor: Colors.transparent);
    ;
  }
}
