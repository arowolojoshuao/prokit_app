import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/roomFinder/models/RoomFinderModel.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFDataGenerator.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFWidget.dart';

import '../components/RFRecentUpdateComponent.dart';

class RFRecentUpdateViewAllScreen extends StatelessWidget {
  final List<RoomFinderModel> hotelListData = hotelList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarWidget(context, title: "Recent Updates", appBarHeight: 80, showLeadingIcon: false, roundCornerShape: true),
      body: ListView.builder(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 24),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => RFRecentUpdateComponent(
          recentUpdateData: hotelListData[index % hotelListData.length],
        ),
      ),
    );
  }
}
