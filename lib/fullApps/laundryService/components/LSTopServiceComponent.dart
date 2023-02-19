import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/ServiceDetail/LSServiceDetailScreen.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSTopServiceComponent extends StatefulWidget {
  static String tag = '/TopServiceComponent';

  @override
  LSTopServiceComponentState createState() => LSTopServiceComponentState();
}

class LSTopServiceComponentState extends State<LSTopServiceComponent> {
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
      itemCount: getTopServiceList().length,
      itemBuilder: (BuildContext context, int index) {
        LSServiceModel data = getTopServiceList()[index];

        return Column(
          children: [
            Container(
              height: 80,
              width: 80,
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              decoration: boxDecorationRoundedWithShadow(40, backgroundColor: context.cardColor),
              child: commonCacheImageWidget(data.img.validate(), 50, width: 50, fit: BoxFit.cover),
            ),
            8.height,
            Text(data.title.validate(), style: primaryTextStyle()),
          ],
        ).onTap(() {
          LSServiceDetailScreen().launch(context);
        });
      },
    );
  }
}
