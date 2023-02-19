import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';

class ActivityChartWebComponent extends StatelessWidget {
  const ActivityChartWebComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width() * 0.25,
      padding: EdgeInsets.all(8),
      decoration: commonCardDecoration(context),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Activities', style: boldTextStyle(size: 20, color: primaryColor)),
                PopupMenuButton(
                  color: primaryColor,
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: SettingItemWidget(
                        title: 'Edit',
                        titleTextStyle: primaryTextStyle(color: white),
                        onTap: () {
                          toasty(context, "Can't Edit");
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: SettingItemWidget(
                        title: 'Delete',
                        titleTextStyle: primaryTextStyle(color: white),
                        onTap: () {
                          toasty(context, "Can't delete");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            8.height,
            CircularPercentIndicator(
              radius: 150,
              lineWidth: 15,
              startAngle: 300,
              percent: 0.55,
              animationDuration: 3000,
              center: Container(
                height: 50,
                width: 50,
                color: primaryColor,
                child: Center(
                  child: Text('55%', style: boldTextStyle(color: white)),
                ),
              ).cornerRadiusWithClipRRect(100),
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              animateFromLastPercent: false,
              progressColor: primaryColor,
              backgroundColor: lightGrey,
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(5), backgroundColor: lightGrey),
                      height: 20,
                      width: 20,
                    ),
                    10.width,
                    Text('Online', style: boldTextStyle(color: primaryColor, size: context.width() < 1200 ? 12 : 18)),
                  ],
                ),
                20.width,
                Row(
                  children: [
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(5),
                        backgroundColor: primaryColor,
                      ),
                      height: 20,
                      width: 20,
                    ),
                    10.width,
                    Text('Offline', style: boldTextStyle(color: primaryColor, size: context.width() < 1200 ? 12 : 18)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
