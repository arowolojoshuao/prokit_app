import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

import 'WATopUPCardScreen.dart';

class WACreditCardScreen extends StatefulWidget {
  static String tag = '/WACreditCardScreen';

  @override
  WACreditCardScreenState createState() => WACreditCardScreenState();
}

class WACreditCardScreenState extends State<WACreditCardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.all(8),
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Icon(Icons.arrow_back),
        ).onTap(() {
          finish(context);
        }),
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              60.height,
              Image.network('$BaseUrl/images/walletApp/wa_credit_card_bg.png', height: 280, width: 280, fit: BoxFit.cover),
              8.height,
              Text('Top Up your Credit Card or\n your phone anytime anywhere', style: boldTextStyle(size: 20), textAlign: TextAlign.center),
              16.height,
              Text('Top up your phone anytime anywhere,\nLoop make it easy and accessible', style: secondaryTextStyle()),
              16.height,
              SizedBox(
                width: context.width() * 0.5,
                child: AppButton(
                    text: "Top Up Credit Card",
                    color: WAPrimaryColor,
                    textColor: Colors.white,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    width: context.width(),
                    onTap: () {
                      WATopUPCardScreen().launch(context);
                    }),
              ),
              16.height,
              SizedBox(
                width: context.width() * 0.5,
                child: AppButton(
                    text: "Top Up to Phone",
                    color: context.cardColor,
                    textColor: WAPrimaryColor,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: WAPrimaryColor),
                    ),
                    width: context.width(),
                    onTap: () {
                      //
                    }),
              ),
            ],
          ).paddingAll(30),
        ),
      ),
    );
  }
}
