import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFCommonAppComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFHotelListComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFLocationComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFRecentUpdateComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFLocationViewAllScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFRecentupdateViewAllScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFSearchDetailScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFViewAllHotelListScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFString.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:prokit_flutter/main.dart';

class RFHomeFragment extends StatefulWidget {
  @override
  _RFHomeFragmentState createState() => _RFHomeFragmentState();
}

class _RFHomeFragmentState extends State<RFHomeFragment> {
  List<RoomFinderModel> categoryData = categoryList();
  List<RoomFinderModel> hotelListData = hotelList();
  List<RoomFinderModel> locationListData = locationList();
  //List<RoomFinderModel> recentUpdateData = recentUpdateList();

  int selectCategoryIndex = 0;

  bool locationWidth = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    setStatusBarColor(rf_primaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RFCommonAppComponent(
        title: RFAppName,
        mainWidgetHeight: 200,
        subWidgetHeight: 130,
        cardWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Find a property anywhere', style: boldTextStyle(size: 18)),
            16.height,
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              decoration: rfInputDecoration(
                hintText: "Search address or near you",
                showPreFixIcon: true,
                showLableText: false,
                prefixIcon: Icon(Icons.location_on, color: rf_primaryColor, size: 18),
              ),
            ),
            16.height,
            AppButton(
              color: rf_primaryColor,
              elevation: 0.0,
              child: Text('Search Now', style: boldTextStyle(color: white)),
              width: context.width(),
              onTap: () {
                RFSearchDetailScreen().launch(context);
              },
            ),
            TextButton(
              onPressed: () {
                //
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Text('Advance Search', style: primaryTextStyle(), textAlign: TextAlign.end),
              ),
            )
          ],
        ),
        subWidget: Column(
          children: [
            HorizontalList(
              padding: EdgeInsets.only(right: 16, left: 16),
              wrapAlignment: WrapAlignment.spaceEvenly,
              itemCount: categoryData.length,
              itemBuilder: (BuildContext context, int index) {
                RoomFinderModel data = categoryData[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCategoryIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: appStore.isDarkModeOn
                          ? scaffoldDarkColor
                          : selectCategoryIndex == index
                              ? rf_selectedCategoryBgColor
                              : rf_categoryBgColor,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text(
                      data.roomCategoryName.validate(),
                      style: boldTextStyle(color: selectCategoryIndex == index ? rf_primaryColor : gray),
                    ),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recently Added Properties', style: boldTextStyle()),
                TextButton(
                  onPressed: () {
                    RFViewAllHotelListScreen().launch(context);
                  },
                  child: Text('View All', style: secondaryTextStyle(decoration: TextDecoration.underline, textBaseline: TextBaseline.alphabetic)),
                )
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 8),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: hotelListData.take(3).length,
              itemBuilder: (BuildContext context, int index) {
                RoomFinderModel data = hotelListData[index];
                return RFHotelListComponent(hotelData: data);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Locations', style: boldTextStyle()),
                TextButton(
                  onPressed: () {
                    RFLocationViewAllScreen(locationWidth: true).launch(context);
                  },
                  child: Text('View All', style: secondaryTextStyle(decoration: TextDecoration.underline)),
                )
              ],
            ).paddingOnly(left: 16, right: 16, bottom: 8),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(locationListData.length, (index) {
                return RFLocationComponent(locationData: locationListData[index]);
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Updates', style: boldTextStyle()),
                TextButton(
                  onPressed: () {
                    RFRecentUpdateViewAllScreen().launch(context);
                  },
                  child: Text('See All', style: secondaryTextStyle(decoration: TextDecoration.underline)),
                )
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 8),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: hotelListData.take(3).length,
              itemBuilder: (BuildContext context, int index) {
                RoomFinderModel data = hotelListData[index];
                return RFRecentUpdateComponent(recentUpdateData: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
