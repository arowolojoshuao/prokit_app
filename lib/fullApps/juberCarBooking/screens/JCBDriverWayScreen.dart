import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBCancelBookingComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBRatingScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBDriverWayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: jcbDarkColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'images/juberCarBooking/jcbIcons/ic_close.png',
            height: 20,
            width: 20,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
          onPressed: () {
            finish(context);
          },
          color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
        ),
        title: Text('Driver on the way', style: boldTextStyle(color: Colors.white)),
        backgroundColor: jcbDarkColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: context.width() - 32,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radius(jcbBottomSheetRadius)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        jcbCommonCachedNetworkImage(
                          '$BaseUrl/images/juberCarBooking/jcb_face1.jpeg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRect(100),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(color: jcbPrimaryColor, borderRadius: radius(jcbBottomSheetRadius)),
                            child: Text('JuberGo'.toUpperCase(), style: boldTextStyle(color: Colors.white, size: 14), textAlign: TextAlign.center),
                          ),
                        )
                      ],
                    ),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Connor Chavez', style: boldTextStyle(size: 18, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                      Container(
                        height: 20,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Icon(index == 4 ? Icons.star_border : Icons.star, color: jcbSecondaryColor, size: 16),
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                        ),
                      ).onTap(() {
                        JCBRatingScreen().launch(context);
                      }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                      10.height,
                      RichText(
                        text: TextSpan(
                          text: 'ST3571 ',
                          style: boldTextStyle(),
                          children: <TextSpan>[
                            TextSpan(text: '- Toyoto Vios', style: secondaryTextStyle(color: jcbGreyColor)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 16),
              20.height,
              jcbTicketLineComponent(context),
              16.height,
              Text('FARE', style: boldTextStyle(color: jcbSecBorderColor)),
              8.height,
              Text('\$25.50', style: boldTextStyle(color: jcbPrimaryColor, size: 40)),
              8.height,
              Text('inc. tax', style: secondaryTextStyle(color: jcbSecBorderColor)),
              16.height,
              Divider(),
              16.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Icon(Icons.circle, color: context.iconColor, size: 14),
                      jcbDottedLineComponent(height: 24),
                      Icon(Icons.square, color: jcbPrimaryColor, size: 16),
                      jcbDottedLineComponent(height: 24),
                      Icon(Icons.square, color: jcbPrimaryColor, size: 16),
                    ],
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pick-up'.toUpperCase(), style: secondaryTextStyle(color: jcbSecBorderColor, size: 10)),
                          Text('199 Brown Estate Apt.866', style: boldTextStyle(size: 14)),
                        ],
                      ),
                      6.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('destination #1'.toUpperCase(), style: secondaryTextStyle(color: jcbSecBorderColor, size: 10)),
                          Text('199 Brown Estate Apt.866', style: boldTextStyle(size: 14)),
                        ],
                      ),
                      6.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('destination #2'.toUpperCase(), style: secondaryTextStyle(color: jcbSecBorderColor, size: 10)),
                          Text('199 Brown Estate Apt.866', style: boldTextStyle(size: 14)),
                        ],
                      ),
                    ],
                  ).expand(),
                ],
              ).paddingSymmetric(horizontal: 16),
              50.height,
              AppButton(
                width: context.width() - 32,
                child: Text('Cancel booking'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      enableDrag: true,
                      isDismissible: false,
                      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            JCBCancelBookingComponent(),
                            16.height,
                            AppButton(
                              width: context.width() - 32,
                              child: Text('Keep the booking'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                              onTap: () {
                                finish(context);
                              },
                              color: jcbPrimaryColor,
                              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
                              elevation: 0,
                            ),
                            8.height,
                            AppButton(
                              width: context.width() - 32,
                              child: Text('cancel ride'.toUpperCase(), style: boldTextStyle(color: jcbPrimaryColor)),
                              onTap: () {
                                finish(context);
                                finish(context);
                              },
                              color: context.scaffoldBackgroundColor,
                              shapeBorder: RoundedRectangleBorder(
                                borderRadius: radius(jcbButtonRadius),
                                side: BorderSide(color: jcbPrimaryColor),
                              ),
                              elevation: 0,
                            ),
                            16.height,
                          ],
                        );
                      });
                },
                color: jcbGreyColor.withAlpha(100),
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
                elevation: 0,
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
