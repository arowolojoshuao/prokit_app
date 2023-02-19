import 'package:cached_network_image/cached_network_image.dart';
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

class GroceryRecipientDetail extends StatefulWidget {
  static String tag = '/GroceryRecipientDetail';

  @override
  _GroceryRecipientDetailState createState() => _GroceryRecipientDetailState();
}

class _GroceryRecipientDetailState extends State<GroceryRecipientDetail> {
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
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
          width: width,
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    //overflow: Overflow.visible,
                    children: [
                      CachedNetworkImage(
                        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                        imageUrl: Grocery_ic_Profile,
                        height: 70,
                        width: 70,
                        fit: BoxFit.fill,
                      ).cornerRadiusWithClipRRect(40.0),
                      Positioned(
                        bottom: -8,
                        left: 32,
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Icon(Icons.camera_alt, size: 30, color: grocery_color_white).center(),
                        ),
                      )
                    ],
                  ),
                  24.width,
                  Text("Change image", style: boldTextStyle(size: 18)).onTap(() {})
                ],
              ),
              8.height,
              EditText(text: "Ishan Maduskha", isPassword: false),
              8.height,
              EditText(
                text: "ish.maduskha@gmail.com",
                isPassword: false,
                keyboardType: TextInputType.emailAddress,
              ),
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
                        width: width * 0.22,
                        decoration: boxDecoration(bgColor: grocery_textColorSecondary.withOpacity(0.5), radius: 10.0),
                      )
                    ],
                  ),
                  16.width,
                  Expanded(
                    child: EditText(text: "71 878 6729", isPassword: false, keyboardType: TextInputType.number),
                  )
                ],
              ).paddingOnly(top: spacing_standard_new),
              SizedBox(height: spacing_standard_new),
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(grocery_lbl_Save, style: boldTextStyle()),
                  color: grocery_colorPrimary,
                  onTap: () {
                    //
                  },
                ),
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
