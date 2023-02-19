import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/webApps/portfolios/utils/Images.dart';

class AvailableForHireWidget extends StatefulWidget {
  static String tag = '/AvailableForHireScreen';

  @override
  AvailableForHireWidgetState createState() => AvailableForHireWidgetState();
}

class AvailableForHireWidgetState extends State<AvailableForHireWidget> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Container(
        height: context.height() + 660,
        child: Stack(
          children: [
            commonCachedNetworkImage(p1HireImg, height: double.infinity, width: context.width(), fit: BoxFit.cover),
            Column(
              children: [
                80.height,
                Text('I\'m Available For Hire', style: primaryTextStyle(size: 36, color: Colors.white)),
                16.height,
                Text(
                  'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                  ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                  'sodales quis. Integer sit amet mattis quam.',
                  style: primaryTextStyle(size: 16, color: white),
                  textAlign: TextAlign.center,
                ).withWidth(context.width() * 0.5),
                50.height,
                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1DesignIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Design', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.Vestibulum ante ipsum primis in'
                            ' faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1MarketingIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Marketing', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1PhotographyIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Photography', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ),
                  ],
                ).paddingOnly(left: 32, right: 32)
              ],
            )
          ],
        ),
      ),
      web: Container(
        height: context.height(),
        child: Stack(
          children: [
            commonCachedNetworkImage(p1HireImg, height: double.infinity, width: context.width(), fit: BoxFit.cover),
            Column(
              children: [
                80.height,
                Text('I\'m Available For Hire', style: primaryTextStyle(size: 36, color: Colors.white)),
                16.height,
                Text(
                  'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                  ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                  'sodales quis. Integer sit amet mattis quam.',
                  style: primaryTextStyle(size: 16, color: white),
                  textAlign: TextAlign.center,
                ).withWidth(context.width() * 0.5),
                50.height,
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.25,
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1DesignIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Design', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.Vestibulum ante ipsum primis in'
                            ' faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ).expand(),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.25,
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1MarketingIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Marketing', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ).expand(),
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      width: context.width() * 0.25,
                      decoration: boxDecoration(bgColor: Colors.white10.withOpacity(0.16), radius: 10),
                      child: Column(
                        children: [
                          24.height,
                          commonCachedNetworkImage(p1PhotographyIcon, height: 50, width: 50, color: Colors.green),
                          24.height,
                          Text('Photography', style: boldTextStyle(size: 18, color: Colors.white)),
                          24.height,
                          Text(
                            'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere'
                            ' cubilia Curae; Nulla mollis dapibus nunc, ut rhoncus turpis '
                            'sodales quis. Integer sit amet mattis quam.',
                            style: primaryTextStyle(size: 16, color: white),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ).paddingOnly(left: 32, right: 32),
                        ],
                      ),
                    ).expand(),
                  ],
                ).paddingOnly(left: 32, right: 32),
              ],
            )
          ],
        ),
      ),
    );
  }
}
