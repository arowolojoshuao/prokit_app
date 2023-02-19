import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryAddCardScreen extends StatefulWidget {
  static String tag = '/GroceryAddCardScreen';

  @override
  _GroceryAddCardScreenState createState() => _GroceryAddCardScreenState();
}

class _GroceryAddCardScreenState extends State<GroceryAddCardScreen> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.clear,
          color: grocery_textColorSecondary,
        ).onTap(
          () {
            finish(context);
          },
        ),
        title: Text(grocery_paymentMethod, style: boldTextStyle(size: 18)),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecorationDefault(color: context.cardColor),
          child: Column(
            children: <Widget>[
              EditText(
                text: grocery_cardHolderName,
                isPassword: false,
                keyboardType: TextInputType.text,
              ).paddingOnly(left: 0, right: spacing_standard_new),
              EditText(
                text: grocery_cardNumber,
                isPassword: false,
                keyboardType: TextInputType.number,
              ).paddingOnly(left: 0, right: spacing_standard_new, top: spacing_standard),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_month,
                        isPassword: false,
                        keyboardType: TextInputType.text,
                      ).paddingOnly(right: 16)),
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_year,
                        isPassword: false,
                        keyboardType: TextInputType.number,
                      ).paddingOnly(right: 16)),
                  Expanded(
                      flex: 1,
                      child: EditText(
                        text: grocery_cvv,
                        isPassword: false,
                        keyboardType: TextInputType.number,
                      )),
                ],
              ).paddingOnly(top: spacing_standard, left: 0),
              Align(
                alignment: Alignment.topRight,
                child: AppButton(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(grocery_save, style: boldTextStyle()),
                  color: grocery_colorPrimary,
                  onTap: () {
                    finish(context);
                  },
                ),
              ).paddingOnly(top: 16, bottom: 16),
            ],
          ).paddingOnly(left: 16, right: 16),
        ).cornerRadiusWithClipRRect(15).paddingOnly(bottom: 16),
      ),
    );
  }
}
