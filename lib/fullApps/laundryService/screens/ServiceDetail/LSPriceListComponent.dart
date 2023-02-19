import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSPriceListComponent extends StatefulWidget {
  static String tag = '/LSPriceListComponent';

  @override
  LSPriceListComponentState createState() => LSPriceListComponentState();
}

class LSPriceListComponentState extends State<LSPriceListComponent> {
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
      body: Container(
        decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
        margin: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: gwtPriceList().length,
            padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, i) {
              LSServiceModel data = gwtPriceList()[i];

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.width,
                  commonCacheImageWidget(data.img, 50, width: 50, fit: BoxFit.cover),
                  16.width,
                  Text(data.title.validate(), style: boldTextStyle()).expand(),
                  Text('\$${data.amount.validate()}/per pcs', style: secondaryTextStyle()),
                ],
              ).paddingAll(8);
            }),
      ),
    );
  }
}
