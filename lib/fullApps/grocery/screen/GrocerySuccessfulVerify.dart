import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GrocerySignUp.dart';

class GrocerySuccessfulVerify extends StatefulWidget {
  static String tag = '/GrocerySuccessfulVerify';

  @override
  _GrocerySuccessfulVerifyState createState() => _GrocerySuccessfulVerifyState();
}

class _GrocerySuccessfulVerifyState extends State<GrocerySuccessfulVerify> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: grocery_colorPrimary,
      body: Column(
        children: <Widget>[
          SizedBox(height: context.height() * 0.10),
          commonCacheImageWidget(grocery_logo, 170, width: 170, fit: BoxFit.fill).center(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: const Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(color: grocery_ShadowColor, blurRadius: 20.0, offset: Offset(0.0, 0.9)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          Grocery_ic_CheckMark,
                          height: 45,
                          width: 45,
                          color: grocery_colorPrimary,
                        ).paddingOnly(left: spacing_standard_new).paddingTop(spacing_large),
                        16.width,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(grocery_lbl_Congratulations, style: boldTextStyle(size: 24)),
                              4.height,
                              Text(grocery_lbl_Cong_Msg, style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        AppButton(
                          color: context.cardColor,
                          child: Text(grocery_lbl_Later, style: boldTextStyle(color: grocery_colorPrimary)),
                          onTap: () {},
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                        16.width,
                        AppButton(
                          color: grocery_colorPrimary,
                          child: Text(grocery_lbl_Sign_In, style: boldTextStyle(color: white)),
                          onTap: () {
                            GrocerySignUp(isSignIn: true, isSignUp: false).launch(context);
                          },
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
