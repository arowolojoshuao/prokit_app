import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryWidget.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryHomeDelivery extends StatefulWidget {
  static String tag = '/GroceryHomeDelivery';

  @override
  _GroceryHomeDeliveryState createState() => _GroceryHomeDeliveryState();
}

class _GroceryHomeDeliveryState extends State<GroceryHomeDelivery> {
  String? selectedLocation1 = "Pannipitiya";
  String? selectedLocation2 = "Egodawatta";

  List<String> location1 = ["Pannipitiya"];

  List<String> location2 = ["Egodawatta"];

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
        grocery_lbl_home_Delivery,
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
          width: context.width(),
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeLight_Color),
                    child: Image.asset(
                      Grocery_ic_Home,
                      height: 10,
                      width: 10,
                      color: grocery_color_white,
                    ).paddingAll(12),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Select delivery area", style: boldTextStyle()),
                      Text("Delivery charges apply", style: secondaryTextStyle()),
                    ],
                  )
                ],
              ),
              16.height,
              Column(
                children: <Widget>[
                  DropdownButton(
                    isExpanded: true,
                    value: selectedLocation1,
                    underline: Container(height: 0),
                    icon: Icon(Icons.arrow_drop_down),
                    style: primaryTextStyle(),
                    onChanged: (String? newValue) {
                      setState(
                        () {
                          selectedLocation1 = newValue;
                        },
                      );
                    },
                    items: location1.map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    itemHeight: 50,
                  ),
                  16.height,
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    DropdownButton(
                      isExpanded: true,
                      value: selectedLocation2,
                      underline: Container(
                        height: 0,
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      style: primaryTextStyle(),
                      onChanged: (String? newValue) {
                        setState(
                          () {
                            selectedLocation2 = newValue;
                          },
                        );
                      },
                      items: location2.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      itemHeight: 50,
                    ),
                    16.height,
                  ],
                ),
              ),
              EditText(text: "424/ 1D, Palanwattam, Pannipitiya", isPassword: false),
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
