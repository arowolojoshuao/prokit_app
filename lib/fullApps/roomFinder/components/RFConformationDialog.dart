import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';

class RFConformationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: context.width(),
        height: 50.0,
        margin: EdgeInsets.only(left: 24, right: 24, top: 90),
        decoration: boxDecorationWithRoundedCorners(backgroundColor: context.scaffoldBackgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: rf_rattingBgColor),
              child: Icon(Icons.done, color: Colors.white, size: 14),
            ),
            16.width,
            Text('Registered Successfully!', style: boldTextStyle(color: greenColor.withOpacity(0.7))),
          ],
        ).onTap(() {
          //
        }, highlightColor: Colors.transparent, splashColor: Colors.transparent),
      ),
    );
  }
}
