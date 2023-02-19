import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBFormTextField.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBSelectCountryCodeScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBVerifyNumberScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBCommon.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBPhoneNoScreen extends StatefulWidget {
  const JCBPhoneNoScreen({Key? key}) : super(key: key);

  @override
  State<JCBPhoneNoScreen> createState() => _JCBPhoneNoScreenState();
}

class _JCBPhoneNoScreenState extends State<JCBPhoneNoScreen> {
  TextEditingController phoneNoCont = TextEditingController();

  String countryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: jcbBackWidget(context),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('What is your \nphone number?', style: boldTextStyle(size: 40, fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, weight: FontWeight.w900)),
            20.height,
            Text(
              'Tap "Get Started" to get SMS confirmation to help you use JUBER. We would like your phone number.',
              style: boldTextStyle(size: 14),
            ),
            40.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Country Code', style: boldTextStyle(color: jcbGreyColor, size: 14)),
                    6.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      decoration: BoxDecoration(border: Border.all(color: appStore.isDarkModeOn ? context.dividerColor : jcbSecBorderColor), borderRadius: radius(jcbButtonRadius)),
                      width: context.width() * 0.26,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(countryCode, style: boldTextStyle()),
                          Icon(Icons.keyboard_arrow_down_outlined),
                        ],
                      ),
                    ).onTap(() {
                      JCBSelectCountryCodeScreen().launch(context).then((value) {
                        if (value != null) {
                          countryCode = value;
                          setState(() {});
                        }
                      });
                    })
                  ],
                ),
                JCBFormTextField(
                  controller: phoneNoCont,
                  autoFocus: false,
                  textInputAction: TextInputAction.done,
                  label: 'Phone Number',
                  width: context.width() * 0.6,
                  textFieldType: TextFieldType.PHONE,
                  labelSpace: true,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            80.height,
            AppButton(
              width: context.width() - 32,
              child: Text('Continue'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                JCBVerifyNumberScreen(phoneNo: phoneNoCont.text).launch(context);
              },
              color: jcbPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
