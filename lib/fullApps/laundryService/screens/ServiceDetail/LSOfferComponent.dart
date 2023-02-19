import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSServiceDetailScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSOfferComponent extends StatefulWidget {
  static String tag = '/LSOfferComponent';

  @override
  LSOfferComponentState createState() => LSOfferComponentState();
}

class LSOfferComponentState extends State<LSOfferComponent> {
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
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
      body: ListView.builder(
          itemCount: getNearByServiceList().length,
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          itemBuilder: (_, i) {
            LSServiceModel data = getNearByServiceList()[i];

            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: context.width(),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCacheImageWidget(data.img, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.height,
                          Text('Flat 30% off on dry clean services.', style: boldTextStyle()),
                          16.height,
                          Text('coupon code', style: secondaryTextStyle()),
                          4.height,
                          Text('LAVUSMSDDFEFFWE10WF', style: boldTextStyle(size: 12)),
                        ],
                      ).expand()
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Valid till 01 Nov 2019', style: boldTextStyle(size: 14)),
                      4.width,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('Details', style: secondaryTextStyle()), 4.width, Icon(Icons.keyboard_arrow_down)],
                      )
                    ],
                  )
                ],
              ),
            ).onTap(() {
              LSServiceDetailScreen().launch(context);
            });
          }),
    );
  }
}
