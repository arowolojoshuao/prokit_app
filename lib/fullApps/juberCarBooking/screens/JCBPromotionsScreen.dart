import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBPromoComponent.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBPromotionsScreen extends StatelessWidget {
  final List<JCBCommonModel> list = jcbGetPromotionsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.cardColor : jcbBackGroundColor,
      appBar: AppBar(
        leading: jcbBackWidget(context),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 6, left: 2),
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(color: jcbPrimaryColor, borderRadius: radius(50)),
            child: Row(
              children: [
                Container(
                  child: Icon(Icons.star_border, color: jcbPrimaryColor, size: 20),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: radius(100)),
                  padding: EdgeInsets.all(4),
                ),
                4.width,
                RichText(
                  text: TextSpan(
                    text: '4.625 ',
                    style: boldTextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: 'points', style: secondaryTextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.scaffoldBackgroundColor,
                border: Border(
                  bottom: BorderSide(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'My Promotions',
                    style: boldTextStyle(
                      size: 40,
                      fontFamily: jcbFont,
                      color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                      weight: FontWeight.w900,
                    ),
                  ),
                  16.height,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: jcbSecBorderColor.withAlpha(100),
                      borderRadius: radius(jcbButtonRadius),
                    ),
                    child: AppTextField(
                      autoFocus: false,
                      textFieldType: TextFieldType.NAME,
                      textStyle: boldTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your promotion code',
                        hintStyle: boldTextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return JCBPromoComponent(element: list[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
