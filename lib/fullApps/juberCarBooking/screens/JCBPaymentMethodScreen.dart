import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/components/JCBPaymentCard.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/models/JCBCommonModel.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/screens/JCBAddPaymentCardScreen.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JBCColors.dart';
import 'package:prokit_flutter/fullApps/juberCarBooking/utils/JCBConstants.dart';
import 'package:prokit_flutter/main.dart';

class JCBPaymentMethodScreen extends StatefulWidget {
  const JCBPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<JCBPaymentMethodScreen> createState() => _JCBPaymentMethodScreenState();
}

class _JCBPaymentMethodScreenState extends State<JCBPaymentMethodScreen> {
  List<JCBCommonModel> cardList = jcbPaymentSelection();

  bool defaultMethod = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'images/juberCarBooking/jcbIcons/ic_close.png',
            height: 20,
            width: 20,
            fit: BoxFit.cover,
            color: context.iconColor,
          ),
          onPressed: () {
            finish(context);
          },
        ),
        actions: [
          Text('Done', style: boldTextStyle(color: jcbPrimaryColor)).paddingAll(16).onTap(() {
            finish(context);
            finish(context);
          }),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment methods',
              style: boldTextStyle(
                size: 40,
                fontFamily: jcbFont,
                color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor,
                weight: FontWeight.w900,
              ),
            ),
            20.height,
            Text('CURRENT METHOD', style: secondaryTextStyle(color: jcbGreyColor)),
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: radius(jcbButtonRadius),
                border: Border.all(color: jcbSecBorderColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Icon(Icons.monetization_on, color: Colors.white),
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                        decoration: BoxDecoration(color: jcbSecondaryColor, borderRadius: radius(jcbButtonRadius)),
                      ),
                      16.width,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cash payment', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor)),
                          Text('Default method', style: secondaryTextStyle(color: jcbGreyColor)),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                    value: defaultMethod,
                    onChanged: (val) {
                      defaultMethod = val.validate();
                      setState(() {});
                    },
                    activeColor: jcbPrimaryColor,
                  ),
                ],
              ),
            ),
            16.height,
            Text(
              'Choose desired vehicle type. We offer cars suitable for most every day needs.',
              style: boldTextStyle(fontFamily: jcbFont, color: appStore.isDarkModeOn ? Colors.white : jcbDarkColor, size: 14),
            ),
            16.height,
            JCBPaymentCard(list: cardList),
            20.height,
            AppButton(
              width: context.width() - 32,
              child: Text('add payment method'.toUpperCase(), style: boldTextStyle(color: Colors.white)),
              onTap: () {
                JCBAddPaymentCardScreen().launch(context).then((value) {
                  if (value != null) {
                    cardList.add(value);
                    setState(() {});
                  }
                });
              },
              color: jcbPrimaryColor,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(jcbButtonRadius)),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }
}
