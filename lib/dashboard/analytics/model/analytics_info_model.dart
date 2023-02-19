import 'package:prokit_flutter/dashboard/analytics/utils/images.dart';
import 'package:prokit_flutter/dashboard/split_bill/utils/images.dart';

class AnalyticsInfoModel {
  String? analyticsTitle;
  String? analyticsRevenue;
  String? analyticsPercentage;
  String? analyticsIcons;
  String? analyticsSubTitle;
  String? pageView;
  String? bounceRate;
  String? visitDuration;
  String? visitorsMonth;
  String? totalVisitors;
  String? increaseRateOfVisitors;

  AnalyticsInfoModel({
    this.analyticsTitle,
    this.analyticsRevenue,
    this.analyticsPercentage,
    this.analyticsIcons,
    this.analyticsSubTitle,
    this.pageView,
    this.bounceRate,
    this.visitDuration,
    this.visitorsMonth,
    this.totalVisitors,
    this.increaseRateOfVisitors,
  });
}

List<AnalyticsInfoModel> getPageAnalyticsList() {
  List<AnalyticsInfoModel> tempPageAnalyticsInfo = [];

  tempPageAnalyticsInfo.add(
    AnalyticsInfoModel(
      analyticsTitle: 'Page Visitors',
      analyticsIcons: ic_group,
      analyticsSubTitle: '175k',
      analyticsPercentage: '80%',
    ),
  );

  tempPageAnalyticsInfo.add(
    AnalyticsInfoModel(
      analyticsTitle: 'Page Reviews',
      analyticsIcons: ic_visibility,
      analyticsSubTitle: '346k',
      analyticsPercentage: '56%',
    ),
  );
  tempPageAnalyticsInfo.add(
    AnalyticsInfoModel(
      analyticsTitle: 'Bounce Rate',
      analyticsIcons: ic_bounce_rate,
      analyticsSubTitle: '64%',
      analyticsPercentage: '-80%',
    ),
  );

  tempPageAnalyticsInfo.add(
    AnalyticsInfoModel(
      analyticsTitle: 'Visit Duration',
      analyticsIcons: ic_visit_duration,
      analyticsSubTitle: '1m 8s',
      analyticsPercentage: '9%',
    ),
  );

  return tempPageAnalyticsInfo;
}

AnalyticsInfoModel revenueData = AnalyticsInfoModel(
  analyticsTitle: 'Revenue',
  analyticsIcons: ic_revenue,
  analyticsRevenue: '59,782',
  analyticsPercentage: '34%',
);

AnalyticsInfoModel monthOfVisitorsData = AnalyticsInfoModel(
  visitorsMonth: 'November',
  totalVisitors: '175,963,029',
  analyticsPercentage: '80%',
);
