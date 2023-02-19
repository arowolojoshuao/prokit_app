import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFHotelListComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:prokit_flutter/main.dart';

class RFLocationScreen extends StatefulWidget {
  @override
  _RFLocationScreenState createState() => _RFLocationScreenState();
}

class _RFLocationScreenState extends State<RFLocationScreen> {
  TextEditingController addressController = TextEditingController();

  List<RoomFinderModel> hotelListData = hotelList();
  List<RoomFinderModel> availableHotelListData = availableHotelList();

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, showLeadingIcon: false, appBarHeight: 50, title: "Search Detail", roundCornerShape: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 32),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12)),
                backgroundColor: rf_primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Search for Property", style: boldTextStyle(color: white)),
                  16.height,
                  AppTextField(
                    controller: addressController,
                    textFieldType: TextFieldType.OTHER,
                    decoration: rfInputDecoration(
                      showLableText: false,
                      showPreFixIcon: true,
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search, color: rf_primaryColor, size: 16),
                          8.width,
                          Text('Imadol', style: boldTextStyle()),
                          8.width,
                          Container(width: 1, height: 15, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.6)),
                          16.width,
                        ],
                      ).paddingOnly(left: 16),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Showing Results', style: boldTextStyle()),
                Text('4 Results', style: secondaryTextStyle()),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            HorizontalList(
              itemCount: availableHotelListData.length,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemBuilder: (_, index) {
                RoomFinderModel data = availableHotelListData[index];

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: selectedIndex == index ? gray.withOpacity(0.1) : Colors.transparent,
                  ),
                  child: Text(
                    data.roomCategoryName.validate(),
                    style: boldTextStyle(
                        color: selectedIndex == index
                            ? appStore.isDarkModeOn
                                ? white
                                : black
                            : appStore.isDarkModeOn
                                ? white.withOpacity(0.4)
                                : gray.withOpacity(0.6)),
                  ),
                ).onTap(() {
                  selectedIndex = index;
                  setState(() {});
                });
              },
            ),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: hotelListData.length,
              itemBuilder: (BuildContext context, int index) => RFHotelListComponent(hotelData: hotelListData[index]),
            ),
          ],
        ),
      ),
    );
  }
}
