import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prokit_flutter/dashboard/analytics/components/last_seen_drop_down_component.dart';
import 'package:prokit_flutter/dashboard/analytics/components/page_analytics_list_component.dart';
import 'package:prokit_flutter/dashboard/analytics/components/page_drop_down_component.dart';
import 'package:prokit_flutter/dashboard/analytics/components/spline_chart_component.dart';
import 'package:prokit_flutter/dashboard/analytics/model/analytics_info_model.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/colors.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/common.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/constant.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/images.dart';
import 'package:prokit_flutter/dashboard/health_medical/utils/images.dart';
import 'package:prokit_flutter/main.dart';

import '../../../main/utils/AppColors.dart';
import '../../banking/utils/images.dart';

class AnalyticsDashboardFragment extends StatefulWidget {
  @override
  _AnalyticsDashboardFragmentState createState() => _AnalyticsDashboardFragmentState();
}

class _AnalyticsDashboardFragmentState extends State<AnalyticsDashboardFragment> {
  List<AnalyticsInfoModel> setPageAnalyticsInfo = getPageAnalyticsList();

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
    bool isNegative = revenueData.analyticsPercentage!.contains('-');
    return Scaffold(
      appBar: appBarWidget(
        "Dashboard",
        elevation: 1,
        showBack: false,
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: Image.asset(ic_search, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Image.asset(ic_notification, height: 20, width: 20, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              //
            },
            icon: ClipRRect(borderRadius: BorderRadius.circular(DEFAULT_ANALYTICS_RADIUS), child: Image.asset(img_person, height: 40, width: 40, fit: BoxFit.cover)),
          ),
          12.width,
        ],
        color: appStore.isDarkModeOn ? appBackgroundColorDark : Colors.white,
        systemUiOverlayStyle: SystemUiOverlayStyle(statusBarColor: appStore.isDarkModeOn ? appBackgroundColorDark : Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Page analytics', style: boldTextStyle(size: 18)),
                Text('See details', style: secondaryTextStyle(size: 16)),
              ],
            ),
            20.height,
            Row(
              children: [
                PageDropDownComponent().expand(),
                16.width,
                LastSeenDropDownComponent().expand(),
              ],
            ),
            20.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(DEFAULT_ANALYTICS_RADIUS)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? iconContainerDarkColor : iconContainerColor,
                      borderRadius: radius(DEFAULT_ANALYTICS_RADIUS),
                      shape: BoxShape.rectangle,
                    ),
                    child: Image.asset(ic_revenue, height: 22, width: 22, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${revenueData.analyticsTitle}'.toUpperCase(), style: secondaryTextStyle()),
                      6.height,
                      richText(
                        text1: '\$${revenueData.analyticsRevenue}   ',
                        style1: boldTextStyle(size: 18),
                        text2: '${isNegative ? "\u2193" : "\u2191"} ${revenueData.analyticsPercentage}',
                        style2: boldTextStyle(size: 14, color: isNegative ? Colors.red : Colors.green),
                      ),
                    ],
                  ).expand(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? iconContainerDarkColor : iconContainerColor,
                      borderRadius: radius(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: TextIcon(
                      text: 'details',
                      textStyle: secondaryTextStyle(size: 16),
                      suffix: Image.asset(ic_details, height: 15, width: 15, color: appStore.isDarkModeOn ? textSecondaryColor : Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(setPageAnalyticsInfo.length, (index) {
                AnalyticsInfoModel pageAnalyticData = setPageAnalyticsInfo[index];
                return Container(
                  width: MediaQuery.of(context).size.width / 2 - 24,
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(DEFAULT_ANALYTICS_RADIUS)),
                  child: PageAnalyticsListComponent(data: pageAnalyticData),
                );
              }),
            ),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${monthOfVisitorsData.visitorsMonth} visitors', style: secondaryTextStyle(size: 16)),
                Container(
                  decoration: BoxDecoration(color: context.cardColor, borderRadius: radius(5), shape: BoxShape.rectangle),
                  child: TextIcon(
                    text: 'details',
                    textStyle: secondaryTextStyle(size: 16),
                    suffix: Image.asset(ic_details, height: 15, width: 15, color: appStore.isDarkModeOn ? textSecondaryColor : Colors.black),
                  ),
                ),
              ],
            ),
            6.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                richText(
                  text1: '${monthOfVisitorsData.totalVisitors} ',
                  style1: boldTextStyle(),
                  text2: 'visitors',
                  style2: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                ),
                Text(
                  '${monthOfVisitorsData.analyticsPercentage}',
                  style: boldTextStyle(size: 14, color: Colors.green),
                )
              ],
            ),
            20.height,
            // For Create Spline Chart
            SplineChartComponent(),
          ],
        ),
      ),
    );
  }
}
