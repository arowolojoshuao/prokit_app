import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBAlertDialogComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBDriverWayScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBReplyScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBFoundDriverComponent extends StatelessWidget {
  const JCBFoundDriverComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      decoration: BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: radiusOnly(topLeft: jcbBottomSheetRadius, topRight: jcbBottomSheetRadius)),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.height,
          Text('We found you a driver'.toUpperCase(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
          6.height,
          Text('Driver will pickup you in 02:35', style: secondaryTextStyle(color: jcbPrimaryColor)),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(color: jcbGreyColor.withAlpha(50), borderRadius: radius(100)),
                child: IconButton(
                    icon: Image.asset(
                      'images/juberCarBooking/jcbIcons/ic_telephone.png',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                      color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: JCBAlertDialogComponent(),
                          );
                        },
                      );
                    }),
              ),
              16.width,
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
              ).onTap(() {
                JCBDriverWayScreen().launch(context);
              }, splashColor: Colors.transparent, highlightColor: Colors.transparent),
              16.width,
              Container(
                decoration: BoxDecoration(color: jcbGreyColor.withAlpha(50), borderRadius: radius(100)),
                child: IconButton(
                    icon: Image.asset(
                      'images/juberCarBooking/jcbIcons/ic_messenger.png',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                      color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                    ),
                    onPressed: () {
                      JCBReplyScreen().launch(context);
                    }),
              ),
            ],
          ),
          16.height,
          Text('Connor Chavez', style: boldTextStyle(size: 18, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
          6.height,
          Container(
            height: 20,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Icon(index == 4 ? Icons.star_border : Icons.star, color: jcbSecondaryColor),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
          16.height,
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
      ),
    );
  }
}
