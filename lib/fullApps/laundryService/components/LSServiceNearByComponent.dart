import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSServiceDetailScreen.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSServiceNearByComponent extends StatefulWidget {
  static String tag = '/LSServiceNearByComponent';

  @override
  LSServiceNearByComponentState createState() => LSServiceNearByComponentState();
}

class LSServiceNearByComponentState extends State<LSServiceNearByComponent> {
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
    return HorizontalList(
      itemCount: getNearByServiceList().length,
      itemBuilder: (BuildContext context, int index) {
        LSServiceModel data = getNearByServiceList()[index];

        return Container(
          width: context.width() * 0.62,
          margin: EdgeInsets.all(8),
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonCacheImageWidget(data.img.validate(), 120, width: context.width(), fit: BoxFit.cover).center().cornerRadiusWithClipRRectOnly(topLeft: 8, topRight: 8),
              8.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(data.title.validate(), style: primaryTextStyle()).expand(),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellowAccent),
                          Text(data.rating.validate(), style: secondaryTextStyle()),
                        ],
                      )
                    ],
                  ),
                ],
              ).paddingOnly(left: 8, right: 8),
              4.height,
              Text(data.location.validate(), style: secondaryTextStyle()).paddingOnly(left: 8, right: 8),
              8.height,
            ],
          ),
        ).onTap(() {
          LSServiceDetailScreen().launch(context);
        });
      },
    );
  }
}
