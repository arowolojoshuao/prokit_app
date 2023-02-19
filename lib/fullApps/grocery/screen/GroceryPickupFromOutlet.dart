import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryPickupFromOutlet extends StatefulWidget {
  static String tag = '/GroceryPickupFromOutlet';

  @override
  _GroceryPickupFromOutletState createState() => _GroceryPickupFromOutletState();
}

class _GroceryPickupFromOutletState extends State<GroceryPickupFromOutlet> {
  String? selectedLocation1 = "Pannipitiya";

  List<String> location1 = ["Pannipitiya"];

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
        grocery_lbl_PickUp,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width(),
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: <Widget>[
              8.height,
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: boxDecoration(radius: 30.0, bgColor: grocery_orangeLight_Color),
                    child: Image.asset(
                      Grocery_ic_bag,
                      height: 10,
                      width: 10,
                      color: grocery_color_white,
                    ).paddingAll(spacing_standard_new),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(grocery_lbl_Pickup_from_outlet, style: boldTextStyle()),
                      Text(grocery_Only_from_Outlet, style: secondaryTextStyle()),
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
                  Divider(
                    height: 20,
                  ),
                ],
              ),
              TextField(
                cursorColor: grocery_colorPrimary,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
                  hintText: "12 April 2020",
                  suffixIcon: Icon(Icons.date_range, color: grocery_icon_color),
                  hintStyle: primaryTextStyle(),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grocery_view_color, width: 0.0)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: grocery_view_color, width: 0.0)),
                ),
              ),
              8.height,
              TextField(
                cursorColor: grocery_colorPrimary,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 8, 4, 8),
                  hintText: "9:30 AM - 10:00 AM",
                  suffixIcon: Icon(Icons.access_time, color: grocery_icon_color),
                  hintStyle: primaryTextStyle(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grocery_view_color, width: 0.0),
                  ),
                ),
              ),
              24.height,
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
              ),
              24.height,
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
