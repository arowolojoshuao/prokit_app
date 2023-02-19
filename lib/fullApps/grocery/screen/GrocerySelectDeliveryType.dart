import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryHomeDelivery.dart';
import 'GroceryPickupFromOutlet.dart';

class GrocerySelectDeliveryType extends StatefulWidget {
  static String tag = '/GrocerySelectDeliveryType';

  @override
  _GrocerySelectDeliveryTypeState createState() => _GrocerySelectDeliveryTypeState();
}

class _GrocerySelectDeliveryTypeState extends State<GrocerySelectDeliveryType> {
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
        grocery_lbl_Select_Delivery_Type,
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
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              8.height,
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeLight_Color),
                    child: Image.asset(Grocery_ic_Home, height: 10, width: 10, color: grocery_color_white).paddingAll(12),
                  ),
                  16.width,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(grocery_lbl_Home_Delivery, style: boldTextStyle()),
                          Text("Within delivery grid", style: secondaryTextStyle()),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 30, color: grocery_textColorSecondary)
                    ],
                  ).expand()
                ],
              ).onTap(() {
                GroceryHomeDelivery().launch(context);
              }).paddingSymmetric(horizontal: 16, vertical: 4),
              Divider(),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: boxDecoration(radius: 25.0, bgColor: grocery_orangeColor),
                    child: Image.asset(Grocery_ic_Home, height: 10, width: 10, color: grocery_color_white).paddingAll(12),
                  ),
                  16.width,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(grocery_lbl_PickUp, style: boldTextStyle()),
                          Text(grocery_Only_from_Outlet, style: secondaryTextStyle()),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 30, color: grocery_textColorSecondary)
                    ],
                  ).expand()
                ],
              ).onTap(
                () {
                  GroceryPickupFromOutlet().launch(context);
                },
              ).paddingSymmetric(horizontal: 16, vertical: 4),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
