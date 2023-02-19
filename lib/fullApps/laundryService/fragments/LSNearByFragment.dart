import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSServiceDetailScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSNearByFragment extends StatefulWidget {
  static String tag = '/LSNearByFragment';

  @override
  LSNearByFragmentState createState() => LSNearByFragmentState();
}

class LSNearByFragmentState extends State<LSNearByFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(context.cardColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'NearBy Laundries',
        showBack: false,
        center: true,
        color: context.cardColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: context.iconColor),
            onPressed: () {
              //
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on, color: LSColorPrimary, size: 16).paddingRight(4),
                      ),
                      TextSpan(text: 'San Francisco', style: primaryTextStyle()),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.airplanemode_on, color: LSColorPrimary, size: 16).paddingRight(4),
                      ),
                      TextSpan(text: 'Change', style: primaryTextStyle(color: LSColorPrimary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(height: 1, thickness: 2);
          },
          itemCount: getNearByServiceList().length,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          shrinkWrap: true,
          itemBuilder: (_, i) {
            LSServiceModel data = getNearByServiceList()[i];

            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: context.width(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonCacheImageWidget(data.img.validate(), 90, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.title.validate(), style: boldTextStyle()),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.star, color: Colors.yellow, size: 16).paddingRight(4),
                                ),
                                TextSpan(text: '${data.rating.validate()}', style: primaryTextStyle(color: LSColorPrimary)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      4.height,
                      Text('145 Valencia St, San Francisco', style: secondaryTextStyle()),
                      4.height,
                      Text('0.2 Km Away', style: boldTextStyle(size: 14, color: LSColorPrimary)),
                    ],
                  ).expand()
                ],
              ),
            ).onTap(() {
              LSServiceDetailScreen().launch(context);
            });
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LSColorPrimary,
        onPressed: () {
          //
        },
        child: Icon(Icons.location_on, color: white),
      ),
    );
  }
}
