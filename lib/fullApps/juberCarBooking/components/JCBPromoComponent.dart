import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/main.dart';

class JCBPromoComponent extends StatelessWidget {
  final JCBCommonModel element;

  JCBPromoComponent({required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radius(8)),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: jcbPrimaryColor.withAlpha(50),
                  borderRadius: radius(100),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'images/juberCarBooking/jcbIcons/ic_discount.png',
                    color: jcbPrimaryColor,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  onPressed: () {},
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 16),
              ),
              SizedBox(
                width: 20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DottedLine(
                      dashColor: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor,
                      lineThickness: 1,
                      lineLength: 110,
                      dashLength: 6,
                      dashGapLength: 4,
                      direction: Axis.vertical,
                    ),
                    Positioned(
                      child: Icon(Icons.circle, size: 20, color: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor),
                      top: -10,
                    ),
                    Positioned(
                      child: Icon(Icons.circle, size: 20, color: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor),
                      bottom: -10,
                    ),
                  ],
                ),
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(element.title.validate(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                  8.height,
                  Text(element.subTitle.validate(), style: secondaryTextStyle(color: jcbGreyColor, size: 12)),
                ],
              ).expand(),
            ],
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Text('Use now', style: boldTextStyle(size: 14, color: jcbPrimaryColor)),
          ),
        ],
      ),
    );
  }
}
