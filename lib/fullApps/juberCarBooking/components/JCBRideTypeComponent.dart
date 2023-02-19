import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBRideModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';

class JCBRideComponent extends StatefulWidget {
  List<JCBRideModel> rideList;

  JCBRideComponent({required this.rideList});

  @override
  State<JCBRideComponent> createState() => _JCBRideComponentState();
}

class _JCBRideComponentState extends State<JCBRideComponent> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widget.rideList.map((e) {
        int index = widget.rideList.indexOf(e);
        return Container(
          width: context.width(),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? jcbPrimaryColor.withAlpha(30)
                : appStore.isDarkModeOn
                    ? context.cardColor
                    : jcbBackGroundColor,
            borderRadius: radius(jcbButtonRadius),
            border: Border.all(
                color: selectedIndex == index
                    ? jcbPrimaryColor
                    : appStore.isDarkModeOn
                        ? context.cardColor
                        : jcbBackGroundColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.title, style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                  Text(e.subTitle, style: boldTextStyle(color: e.isBest.validate() ? jcbSecondaryColor : jcbGreyColor, size: 14)),
                  16.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.cost, style: boldTextStyle(color: jcbPrimaryColor)),
                      20.width,
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: secondaryTextStyle(color: jcbGreyColor),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(Icons.access_time_outlined, color: jcbGreyColor, size: 14),
                              ),
                            ),
                            TextSpan(text: e.time),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              jcbCommonCachedNetworkImage(e.image, height: 70, width: 80, fit: BoxFit.fill),
            ],
          ),
        ).onTap(
          () {
            selectedIndex = index;
            setState(() {});
          },
          borderRadius: radius(jcbButtonRadius),
        ).paddingSymmetric(vertical: 8);
      }).toList(),
    );
  }
}
