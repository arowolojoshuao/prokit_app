import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFormTextField.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class JCBAddPaymentCardScreen extends StatefulWidget {
  @override
  State<JCBAddPaymentCardScreen> createState() => _JCBAddPaymentCardScreenState();
}

class _JCBAddPaymentCardScreenState extends State<JCBAddPaymentCardScreen> {
  TextEditingController cardNo = TextEditingController();
  TextEditingController expires = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add credit card', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900)),
            20.height,
            AppButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/juberCarBooking/jcbIcons/ic_scan.png',
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                  10.width,
                  Text('Scan card'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
                ],
              ),
              onTap: () {
                //
              },
              color: jcbPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ),
            16.height,
            JCBFormTextField(
              label: 'Name'.toUpperCase(),
              textFieldType: TextFieldType.NAME,
            ),
            16.height,
            JCBFormTextField(
              controller: cardNo,
              label: 'credit card number'.toUpperCase(),
              textFieldType: TextFieldType.PHONE,
              keyboardType: TextInputType.number,
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expires'.toUpperCase(), style: boldTextStyle(color: jcbGreyColor, size: 14)),
                    6.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor),
                        borderRadius: radius(jcbButtonRadius),
                      ),
                      width: context.width() / 2 - 24,
                      child: AppTextField(
                        keyboardType: TextInputType.name,
                        autoFocus: false,
                        controller: expires,
                        textFieldType: TextFieldType.PHONE,
                        textInputAction: TextInputAction.next,
                        textStyle: boldTextStyle(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'MM/DD/YYYY',
                          hintStyle: boldTextStyle(color: jcbGreyColor, size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                JCBFormTextField(
                  label: 'CVV',
                  width: context.width() / 2 - 24,
                  textFieldType: TextFieldType.NAME,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  labelSpace: true,
                ),
              ],
            ),
            50.height,
            Text(
              'Debit crads are accepted at some locations and for categories.',
              style: secondaryTextStyle(color: jcbGreyColor),
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                jcbCommonCachedNetworkImage(
                  '$BaseUrl/images/juberCarBooking/jcb_visacard.png',
                  height: 40,
                  width: context.width() / 5 - 8,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(jcbButtonRadius),
                jcbCommonCachedNetworkImage(
                  '$BaseUrl/images/juberCarBooking/jcb_mastercard.png',
                  height: 40,
                  width: context.width() / 5 - 8,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(jcbButtonRadius),
                jcbCommonCachedNetworkImage(
                  '$BaseUrl/images/juberCarBooking/jcb_discovercard.png',
                  height: 60,
                  width: context.width() / 5 - 8,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(jcbButtonRadius),
                jcbCommonCachedNetworkImage(
                  '$BaseUrl/images/juberCarBooking/jcb_americanexpress_card.png',
                  height: 40,
                  width: context.width() / 5 - 8,
                  fit: BoxFit.fitHeight,
                ).cornerRadiusWithClipRRect(jcbButtonRadius),
                jcbCommonCachedNetworkImage(
                  '$BaseUrl/images/juberCarBooking/jcb_cirruscard.png',
                  height: 40,
                  width: context.width() / 5 - 8,
                  fit: BoxFit.cover,
                ).cornerRadiusWithClipRRect(jcbButtonRadius),
              ],
            ),
            20.height,
            AppButton(
              width: context.width() - 32,
              child: Text('save'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                if (cardNo.text != '' && expires.text != '') {
                  finish(context, JCBCommonModel(title: cardNo.text, subTitle: expires.text, image: 'images/juberCarBooking/jcbIcons/ic_visa.png'));
                } else {
                  return toast('Please enter all details properly');
                }
              },
              color: jcbPrimaryColor,
              elevation: 0,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
            ),
          ],
        ),
      ),
    );
  }
}
