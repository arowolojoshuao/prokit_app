import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSServiceDetailScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSSOfferPackageComponent extends StatefulWidget {
  static String tag = '/LSServiceNearByComponent';

  @override
  LSSOfferPackageComponentState createState() => LSSOfferPackageComponentState();
}

class LSSOfferPackageComponentState extends State<LSSOfferPackageComponent> {
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
      itemCount: getOfferList().take(4).length,
      itemBuilder: (BuildContext context, int index) {
        LSServiceModel data = getOfferList()[index];

        return Container(
          width: 280,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.only(top: 24, bottom: 24, left: 8, right: 8),
          decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              commonCacheImageWidget(data.img.validate(), 80, fit: BoxFit.cover).center(),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data.title.validate(), style: primaryTextStyle()),
                  Text(data.subTitle.validate(), style: primaryTextStyle(color: LSColorPrimary, size: 18)),
                  8.height,
                  AppButton(
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                    onTap: () {},
                    text: 'View Offer',
                    textColor: white,
                    color: LSColorPrimary,
                  )
                ],
              )
            ],
          ),
        ).onTap(() {
          LSServiceDetailScreen().launch(context);
        });
      },
    );
  }
}
