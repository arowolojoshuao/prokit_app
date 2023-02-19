import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBCancelBookingComponent extends StatelessWidget {
  const JCBCancelBookingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radiusOnly(topLeft: jcbBottomSheetRadius, topRight: jcbBottomSheetRadius)),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.height,
          Icon(
            Icons.error,
            color: jcbPrimaryColor,
            size: 100,
          ),
          16.height,
          Text('cancel this ride?'.toUpperCase(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
          8.height,
          Text(
            'Passengers that cancel less will get faster bookings.',
            style: secondaryTextStyle(color: context.iconColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
