import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBRideModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBMyRidesScreen extends StatefulWidget {
  @override
  State<JCBMyRidesScreen> createState() => _JCBMyRidesScreenState();
}

class _JCBMyRidesScreenState extends State<JCBMyRidesScreen> {
  List<JCBRideModel> rideList = getMyRides();

  List<String> tabs = ['upcoming', 'completed', 'cancelled'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor,
      appBar: AppBar(
        leading: jcbBackWidget(context),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                border: Border(
                  bottom: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My rides',
                    style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
                  ).paddingAll(16),
                  Row(
                    children: tabs.map((e) {
                      int index = tabs.indexOf(e);
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: context.width() / 3,
                        decoration: BoxDecoration(
                          border: selectedIndex == index ? Border(bottom: BorderSide(color: jcbPrimaryColor, width: 2)) : Border(),
                        ),
                        child: Text(
                          e.toUpperCase(),
                          style: boldTextStyle(color: selectedIndex == index ? jcbPrimaryColor : jcbGreyColor),
                          textAlign: TextAlign.center,
                        ),
                      ).onTap(() {
                        selectedIndex = index;
                        setState(() {});
                      });
                    }).toList(),
                  )
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: rideList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(borderRadius: radius(8), color: context.scaffoldBackgroundColor),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rideList[index].time, style: primaryTextStyle()),
                      16.height,
                      jcbCommonCachedNetworkImage(
                        rideList[index].image,
                        height: 120,
                        width: context.width() - 32,
                        fit: BoxFit.cover,
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(rideList[index].title.toUpperCase(), style: boldTextStyle()),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.location_on_outlined, color: jcbPrimaryColor, size: 14),
                                    ),
                                    TextSpan(text: rideList[index].subTitle, style: secondaryTextStyle()),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Price'.toUpperCase(), style: secondaryTextStyle(color: jcbGreyColor)),
                              Text(rideList[index].cost, style: boldTextStyle(color: jcbPrimaryColor)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
