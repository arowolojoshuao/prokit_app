import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFImages.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:prokit_flutter/main.dart';

class RFHotelDetailComponent extends StatelessWidget {
  final List<RoomFinderModel> hotelImageData = hotelImageList();
  final RoomFinderModel? hotelData;

  RFHotelDetailComponent({this.hotelData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              children: [
                rfCommonCachedNetworkImage(rf_user, width: 60, height: 60, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Courtney Henry', style: boldTextStyle()),
                    4.height,
                    Text('Landlord', style: secondaryTextStyle()),
                  ],
                ).expand(),
                AppButton(
                  onTap: () {
                    launchCall("1234567890");
                  },
                  color: rf_primaryColor,
                  width: 15,
                  height: 15,
                  elevation: 0,
                  child: rf_call.iconImage(iconColor: white, size: 14),
                ),
                8.width,
                AppButton(
                  onTap: () {
                    launchMail("demo@gmail.com");
                  },
                  color: rf_primaryColor,
                  width: 15,
                  height: 15,
                  elevation: 0,
                  child: rf_message.iconImage(iconColor: white, size: 14),
                ),
              ],
            ),
            24.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: rf_primaryColor).paddingOnly(top: 2),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1.2 km from Gwarko', style: boldTextStyle()),
                    8.height,
                    Text('Mahalaxmi, Lalitpur', style: primaryTextStyle()),
                    8.height,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('0 Applied', style: boldTextStyle(color: appStore.isDarkModeOn ? white : rf_textColor)).flexible(),
                        4.width,
                        Container(height: 16, width: 1, color: context.iconColor),
                        4.width,
                        Text('19 Views', style: boldTextStyle(color: appStore.isDarkModeOn ? white : rf_textColor)).flexible(),
                      ],
                    )
                  ],
                ).expand(),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: boxDecorationWithRoundedCorners(backgroundColor: hotelData!.color!, boxShape: BoxShape.circle),
                        ),
                        6.width,
                        Text(hotelData!.address.validate(), style: secondaryTextStyle()),
                      ],
                    ),
                    8.height,
                    Text(
                      'Property Owned By: Alok',
                      style: primaryTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ).paddingOnly(left: 2),
                    8.height,
                    Text(
                      'View on Google Maps',
                      style: primaryTextStyle(color: appStore.isDarkModeOn ? white : rf_textColor, decoration: TextDecoration.underline),
                    ).paddingOnly(left: 2),
                  ],
                ).expand()
              ],
            ),
          ],
        ).paddingAll(24),
        HorizontalList(
          padding: EdgeInsets.only(right: 24, left: 24),
          wrapAlignment: WrapAlignment.spaceEvenly,
          itemCount: hotelImageData.length,
          itemBuilder: (_, int index) => Stack(
            alignment: Alignment.center,
            children: [
              rfCommonCachedNetworkImage(hotelImageData[index].img.validate(), height: 70, width: 70, fit: BoxFit.cover),
              Container(
                height: 70,
                width: 70,
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: black.withOpacity(0.5),
                ),
              ),
              Text('+ 5', style: boldTextStyle(color: white, size: 20), textAlign: TextAlign.center).visible(index == 3),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description', style: boldTextStyle()),
            8.height,
            Text(
              '1 big hall room for rent at lalitpur, ktm with the facilities of bike parking and tap water . it offers 1 bedroom,and a 1 common bathroom for whole flat. It is suitable for student only. Price is negotiable for student only. ',
              style: secondaryTextStyle(),
            ),
            24.height,
            Text('Facilities', style: boldTextStyle()),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.done, size: 16, color: rf_primaryColor),
                        8.width,
                        Text('1 Big Hall', style: secondaryTextStyle()),
                      ],
                    ),
                    4.height,
                    Row(
                      children: [
                        Icon(Icons.done, size: 16, color: rf_primaryColor),
                        8.width,
                        Text('Bikes and Car Parking ', style: secondaryTextStyle()),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.done, size: 16, color: rf_primaryColor),
                        8.width,
                        Text('Shared Toilet', style: secondaryTextStyle()),
                      ],
                    ),
                    4.height,
                    Row(
                      children: [
                        Icon(Icons.done, size: 16, color: rf_primaryColor),
                        8.width,
                        Text('24/7 Water facility', style: secondaryTextStyle()),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ).paddingOnly(left: 24, right: 24, top: 24, bottom: 8),
      ],
    );
  }
}
