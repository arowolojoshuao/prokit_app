import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSContstants.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSReferScreen extends StatefulWidget {
  static String tag = '/LSReferScreen';

  @override
  LSReferScreenState createState() => LSReferScreenState();
}

class LSReferScreenState extends State<LSReferScreen> {
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
      appBar: appBarWidget('Refer and Earn', elevation: 0.0, center: true, color: context.cardColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                commonCacheImageWidget(LSBgRefer, context.height() * 0.4, width: context.width(), fit: BoxFit.fitWidth),
                Container(
                  height: context.height() * 0.4,
                  width: context.width(),
                  color: appStore.isDarkModeOn ? Colors.transparent : white.withOpacity(0.5),
                ),
                Positioned(
                  bottom: 16,
                  child: commonCacheImageWidget(LSRefer, 180, fit: BoxFit.cover),
                )
              ],
            ),
            8.height,
            Text('Refer & Earn a Free Wash', style: boldTextStyle(size: 24)),
            8.height,
            Text(lsWalkSubTitle, style: secondaryTextStyle(), textAlign: TextAlign.center).paddingAll(8),
            8.height,
            DottedBorderWidget(
              color: LSColorPrimary,
              radius: 6.0,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text('ABCD 12345', style: boldTextStyle()),
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: LSColorPrimary, borderRadius: BorderRadius.circular(40)),
              child: Icon(Icons.share, size: 24, color: white),
            )
          ],
        ),
      ),
    );
  }
}
