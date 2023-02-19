import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBApplyPromoBottomSheet.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBRideTypeComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBRideModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBSuggestedRidesScreen extends StatefulWidget {
  const JCBSuggestedRidesScreen({Key? key}) : super(key: key);

  @override
  State<JCBSuggestedRidesScreen> createState() => _JCBSuggestedRidesScreenState();
}

class _JCBSuggestedRidesScreenState extends State<JCBSuggestedRidesScreen> {
  List<JCBRideModel> rideList = getRideTypes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            16.height,
            Text(
              'SUGGESTED RIDES',
              style: boldTextStyle(size: 20, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900),
            ),
            8.height,
            JCBRideComponent(rideList: rideList),
            Divider(color: jcbSecBorderColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor),
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.monetization_on, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 18),
                      ),
                      TextSpan(text: 'Cash payment'),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Promo', style: secondaryTextStyle(color: context.iconColor)),
                    Container(
                      height: 20,
                      width: 1,
                      color: jcbSecBorderColor,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Icon(Icons.calendar_today_outlined, color: context.iconColor, size: 16),
                    Container(
                      height: 20,
                      width: 1,
                      color: jcbSecBorderColor,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                    ),
                    Icon(Icons.edit, color: context.iconColor, size: 16)
                  ],
                ),
              ],
            ),
            16.height,
          ],
        ),
      ).paddingTop(context.statusBarHeight),
      bottomNavigationBar: AppButton(
        child: Text('Book Now'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
        onTap: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              isDismissible: false,
              shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
              builder: (context) {
                return JCBApplyPromoBottomSheet();
              });
        },
        color: jcbPrimaryColor,
        elevation: 0,
        shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
      ).paddingOnly(left: 16, right: 16, bottom: 16),
    );
  }
}
