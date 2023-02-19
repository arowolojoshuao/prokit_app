import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBReplyScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:url_launcher/url_launcher.dart';

class JCBAlertDialogComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: context.width(),
      decoration: BoxDecoration(borderRadius: radius(jcbBottomSheetRadius)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              jcbCommonCachedNetworkImage(
                '$BaseUrl/images/juberCarBooking/jcb_face1.jpeg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRect(100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Connor Chavez', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                  Container(
                    height: 16,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Icon(index == 4 ? Icons.star_border : Icons.star, color: jcbSecondaryColor, size: 14),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ).onTap(() {}, splashColor: Colors.transparent, highlightColor: Colors.transparent),
                  4.height,
                  RichText(
                    text: TextSpan(
                      text: 'ST3571 ',
                      style: boldTextStyle(size: 12),
                      children: <TextSpan>[
                        TextSpan(text: '- Toyoto Vios', style: secondaryTextStyle(color: jcbGreyColor, size: 10)),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(color: jcbSecondaryColor, borderRadius: radius(100)),
                child: IconButton(
                  icon: Image.asset(
                    'images/juberCarBooking/jcbIcons/ic_telephone.png',
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  onPressed: () async {
                    const url = "tel:1234567";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      log('Could not launch $url');
                    }
                  },
                ),
              )
            ],
          ),
          Divider(height: 20),
          Text(
            'Your driver has arrived. Please br ready there within 5 minutes.',
            style: secondaryTextStyle(color: context.iconColor),
          ),
          16.height,
          AppButton(
            width: context.width(),
            child: Text('reply'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
            color: jcbPrimaryColor,
            onTap: () {
              finish(context);
              JCBReplyScreen().launch(context);
            },
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
