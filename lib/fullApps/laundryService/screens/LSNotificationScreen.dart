import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';

class LSNotificationScreen extends StatefulWidget {
  static String tag = '/LSNotificationScreen';

  @override
  LSNotificationScreenState createState() => LSNotificationScreenState();
}

class LSNotificationScreenState extends State<LSNotificationScreen> {
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
      appBar: appBarWidget('Notification', center: true, color: context.cardColor),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 2);
          },
          itemCount: getNotificationList().length,
          shrinkWrap: true,
          itemBuilder: (_, i) {
            LSServiceModel data = getNotificationList()[i];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(data.img.validate(), 40, width: 40, fit: BoxFit.cover),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.title.validate(), style: boldTextStyle()).expand(),
                        Text(data.date.validate(), style: secondaryTextStyle()),
                      ],
                    ),
                    4.height,
                    Text(data.subTitle.validate(), style: secondaryTextStyle()),
                  ],
                ).expand()
              ],
            ).paddingAll(16);
          }),
    );
  }
}
