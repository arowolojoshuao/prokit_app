import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart' as GW;
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

import 'GroceryVerifyNumber.dart';

class GroceryAddNumber extends StatefulWidget {
  static String tag = '/GroceryAddNumber';

  @override
  _GroceryAddNumberState createState() => _GroceryAddNumberState();
}

class _GroceryAddNumberState extends State<GroceryAddNumber> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: GW.title(grocery_lbl_Add_Number, grocery_colorPrimary, grocery_color_white, context),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width(),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: spacing_standard),
              text(grocery_lbl_What_your_Number, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
              text(
                grocery_lbl_Enter_your_Mobile,
                textColor: grocery_textColorSecondary,
                fontSize: textSizeLargeMedium,
              ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CountryCodePicker(onChanged: print, showFlag: false),
                          Icon(Icons.arrow_drop_down, size: 30, color: grocery_textColorSecondary),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: context.width() * 0.22,
                        decoration: boxDecoration(bgColor: grocery_textColorSecondary.withOpacity(0.5), radius: 10.0),
                      ).paddingOnly(left: spacing_standard_new)
                    ],
                  ),
                  Expanded(
                    child: GW.EditText(
                      text: grocery_hint_Enter_mobile_number,
                      isPassword: false,
                      keyboardType: TextInputType.number,
                    ).paddingOnly(left: spacing_standard_new, right: spacing_standard_new),
                  )
                ],
              ).paddingOnly(top: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              Align(
                alignment: Alignment.centerRight,
                child: FittedBox(
                  child: GW
                      .groceryButton(
                        textContent: grocery_lbl_send,
                        onPressed: (() {
                          GroceryVerifyNumber().launch(context);
                        }),
                      )
                      .paddingOnly(right: spacing_standard_new, bottom: spacing_standard_new),
                ).paddingOnly(top: spacing_standard_new, bottom: spacing_standard_new),
              )
            ],
          ),
        ),
      ),
    );
  }
}
