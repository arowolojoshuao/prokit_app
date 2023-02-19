import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/components/RFRecentUpdateComponent.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFLocationScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';
import 'package:prokit_flutter/main.dart';

class RFSearchDetailScreen extends StatelessWidget {
  final TextEditingController addressController = TextEditingController();

  final List<RoomFinderModel> hotelListData = hotelList();
  //final List<RoomFinderModel> recentUpdateData = recentUpdateList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(
        context,
        showLeadingIcon: false,
        appBarHeight: 50,
        title: "Search Detail",
        roundCornerShape: false,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    onFieldSubmitted: (v) {
                      RFLocationScreen().launch(context);
                    },
                  )
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Showing Results', style: boldTextStyle()),
                Text('${hotelListData.take(3).length} Results', style: secondaryTextStyle()),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: hotelListData.take(3).length,
              itemBuilder: (BuildContext context, int index) => RFRecentUpdateComponent(recentUpdateData: hotelListData[index]),
            ),
          ],
        ),
      ),
    );
  }
}
