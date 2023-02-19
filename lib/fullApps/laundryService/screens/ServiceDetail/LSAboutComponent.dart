import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/dating/utils/DAWidgets.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSContstants.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';

import '../../../../main.dart';

class LSAboutComponent extends StatefulWidget {
  const LSAboutComponent({Key? key}) : super(key: key);

  @override
  State<LSAboutComponent> createState() => _LSAboutComponentState();
}

class _LSAboutComponentState extends State<LSAboutComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(thickness: 3, color: lightGrey.withOpacity(0.4)),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Us', style: boldTextStyle()),
                  8.height,
                  Text(lsWalkSubTitle, style: secondaryTextStyle(), textAlign: TextAlign.start),
                  16.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Addresses', style: boldTextStyle()),
                          8.height,
                          Text('145 Valencia St, San Francisco, CA 94103,United States', style: secondaryTextStyle()),
                          8.height,
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.directions, color: LSColorPrimary, size: 16).paddingRight(4),
                                ),
                                TextSpan(text: 'Get Directions - 0.2 KM', style: primaryTextStyle(color: LSColorPrimary)),
                              ],
                            ),
                          ),
                        ],
                      ).expand(),
                      16.width,
                      Stack(
                        children: [
                          commonCachedNetworkImage(LSMap, height: 100, width: 150, fit: BoxFit.cover),
                          Container(
                            height: 100,
                            width: 150,
                            color: black.withOpacity(0.5),
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            decoration: boxDecorationWithShadow(),
                            child: Text('Show Map', style: boldTextStyle()).center(),
                          ),
                        ],
                      )
                    ],
                  ),
                  12.height,
                  Text('Opening Hours', style: boldTextStyle()),
                  16.height,
                  UL(
                    symbolType: SymbolType.Bullet,
                    children: [
                      Text('Monday : 08:00 AM - 08:00 PM', style: primaryTextStyle()),
                      Text('Tuesday : 08:00 AM - 08:00 PM', style: primaryTextStyle()),
                      Text('Friday : 08:00 AM - 08:00 PM', style: primaryTextStyle()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
