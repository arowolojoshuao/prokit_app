import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/roomFinder/screens/RFHomeScreen.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFColors.dart';
import 'package:prokit_flutter/fullApps/roomFinder/utils/RFImages.dart';

import '../utils/RFWidget.dart';

class RFCongratulatedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          rfCommonCachedNetworkImage(rf_congratulate, height: 120, width: 120, fit: BoxFit.cover),
          16.height,
          Text('Congratulations', style: boldTextStyle(size: 22)),
          8.height,
          Text('Your booking has been successfully done.', style: secondaryTextStyle(height: 1.5), textAlign: TextAlign.center),
          30.height,
          AppButton(
            color: rf_primaryColor,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            text: "Done",
            onTap: () {
              RFHomeScreen().launch(context).then((value) {
                finish(context);
              });
            },
            textStyle: boldTextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
