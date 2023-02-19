import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSServicesComponent extends StatefulWidget {
  static String tag = '/LSServicesComponent';

  @override
  LSServicesComponentState createState() => LSServicesComponentState();
}

class LSServicesComponentState extends State<LSServicesComponent> {
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
          itemCount: getTopServiceList().length,
          padding: EdgeInsets.all(8),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (_, i) {
            LSServiceModel data = getTopServiceList()[i];

            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              width: context.width(),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  0.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.title.validate(), style: boldTextStyle(color: LSColorPrimary)),
                      8.height,
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.scaffoldBackgroundColor),
                        child: Text('48 Hours', style: secondaryTextStyle()),
                      )
                    ],
                  ).center(),
                  commonCacheImageWidget(data.img, 100, width: 100, fit: BoxFit.cover),
                  16.width,
                ],
              ),
            ).onTap(() {
              // LSCategoryDetailScreen(title: data.title.validate()).launch(context);
            }, borderRadius: BorderRadius.circular(8));
          }),
    );
  }
}
