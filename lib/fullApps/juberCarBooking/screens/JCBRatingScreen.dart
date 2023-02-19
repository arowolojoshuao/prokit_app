import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

class JCBRatingScreen extends StatefulWidget {
  const JCBRatingScreen({Key? key}) : super(key: key);

  @override
  State<JCBRatingScreen> createState() => _JCBRatingScreenState();
}

class _JCBRatingScreenState extends State<JCBRatingScreen> {
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
        title: Text('Rating', style: boldTextStyle(color: Colors.white)),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
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
                          ),
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
                  ).paddingAll(16),
                  jcbTicketLineComponent(context),
                  20.height,
                  Text('how is your trip?'.toUpperCase(), style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 20)),
                  8.height,
                  Text(
                    'Your feedback will help us to improve \ndriving experience better',
                    style: secondaryTextStyle(color: jcbGreyColor),
                    textAlign: TextAlign.center,
                  ),
                  30.height,
                  RatingBar(
                    initialRating: 4,
                    minRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(Icons.star, color: jcbSecondaryColor),
                    onRatingUpdate: (rating) {
                      //
                    },
                  ).center(),
                  30.height,
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                      borderRadius: radius(jcbButtonRadius),
                    ),
                    width: context.width() - 32,
                    child: AppTextField(
                      autoFocus: false,
                      textFieldType: TextFieldType.NAME,
                      textInputAction: TextInputAction.done,
                      textStyle: boldTextStyle(),
                      minLines: 4,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Additional comments...',
                        hintStyle: boldTextStyle(color: jcbGreyColor, size: 14),
                      ),
                    ),
                  ),
                ],
              ),
              AppButton(
                width: context.width() - 32,
                child: Text('submit review'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                onTap: () {
                  finish(context);
                },
                color: jcbPrimaryColor,
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
