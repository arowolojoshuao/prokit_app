import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';

class GroceryRecipient extends StatefulWidget {
  static String tag = '/GroceryRecipient';

  @override
  _GroceryRecipientState createState() => _GroceryRecipientState();
}

class _GroceryRecipientState extends State<GroceryRecipient> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    changeStatusColor(appStore.isDarkModeOn ? scaffoldDarkColor : white);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(context.cardColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        grocery_lbl_Recipient_Details,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        backWidget: IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeLight_Color),
                    child: Image.asset(Grocery_ic_Home, height: 10, width: 10, color: grocery_color_white).paddingAll(12),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter recipient", style: boldTextStyle(size: 18)),
                      Text("one who receives shopping items", style: secondaryTextStyle()),
                    ],
                  )
                ],
              ),
              16.height,
              EditText(text: "Ishan Maduskha", fontSize: textSizeLargeMedium, isPassword: false),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          CountryCodePicker(onChanged: print, showFlag: false),
                          Icon(Icons.arrow_drop_down, size: 30, color: grocery_textColorSecondary),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: context.width() * 0.24,
                        decoration: boxDecoration(bgColor: grocery_textColorSecondary.withOpacity(0.5)),
                      )
                    ],
                  ),
                  16.width,
                  EditText(text: "71 878 6729", isPassword: false, keyboardType: TextInputType.number).expand()
                ],
              ).paddingOnly(top: spacing_standard_new),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery_lbl_Save, style: boldTextStyle()),
                    color: context.cardColor,
                    onTap: () {
                      finish(context);
                    },
                  ),
                  16.width,
                  AppButton(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(grocery_lbl_Next, style: boldTextStyle()),
                    color: grocery_colorPrimary,
                    onTap: () {
                      finish(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
