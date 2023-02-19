import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'ServiceDetail/LSServiceDetailScreen.dart';

class LSOfferAllScreen extends StatefulWidget {
  static String tag = '/LSOfferAllScreen';

  @override
  LSOfferAllScreenState createState() => LSOfferAllScreenState();
}

class LSOfferAllScreenState extends State<LSOfferAllScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkModeOn ? context.cardColor : Colors.white);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? context.cardColor : LSColorPrimary);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Special Package & Offers', center: true, color: context.cardColor),
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      body: ListView.builder(
          itemCount: getOfferList().length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (_, i) {
            LSServiceModel data = getOfferList()[i];
            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.only(top: 24, bottom: 24, left: 8, right: 8),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ).expand(),
                  8.width,
                  AppButton(
                    padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                    onTap: () {},
                    text: 'View Offer',
                    textColor: white,
                    color: LSColorPrimary,
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
