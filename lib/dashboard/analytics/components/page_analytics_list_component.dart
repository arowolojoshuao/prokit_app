import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/dashboard/analytics/model/analytics_info_model.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/colors.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/common.dart';
import 'package:prokit_flutter/dashboard/analytics/utils/constant.dart';
import 'package:prokit_flutter/main.dart';

class PageAnalyticsListComponent extends StatelessWidget {
  const PageAnalyticsListComponent({Key? key, this.data}) : super(key: key);

  final AnalyticsInfoModel? data;

  @override
  Widget build(BuildContext context) {
    bool isNegative = data!.analyticsPercentage!.contains('-');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                child: Image.asset(data!.analyticsIcons!, height: 22, width: 22, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(child: Text('${data!.analyticsTitle!}'.toUpperCase(), style: secondaryTextStyle())),
                  6.height,
                  richText(
                    text1: '${data!.analyticsSubTitle!}   ',
                    style1: boldTextStyle(),
                    text2: '${isNegative ? "\u2193" : "\u2191"} ${data!.analyticsPercentage!}',
                    style2: boldTextStyle(size: 14, color: isNegative ? Colors.red : Colors.green),
                  ).fit(),
                ],
              ).expand(),
            ],
          ),
        ),
      ],
    );
  }
}
