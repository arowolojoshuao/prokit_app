import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/panel.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryPaymentMethod.dart';
import 'GroceryRecipient.dart';
import 'GrocerySaveCart.dart';
import 'GrocerySelectDeliveryType.dart';

class GroceryCheckOut extends StatefulWidget {
  static String tag = '/GroceryCheckOut';

  @override
  GroceryCheckOutState createState() => GroceryCheckOutState();
}

class GroceryCheckOutState extends State<GroceryCheckOut> {
  final double _initFabHeight = 90.0;
  double? fabHeight;
  double? _panelHeightOpen;

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
    _panelHeightOpen = MediaQuery.of(context).size.height * .55;
    double _panelHeightClosed = MediaQuery.of(context).size.width * 0.2;
    var width = MediaQuery.of(context).size.width;

    Widget mIcon() {
      return Row(
        children: [
          Container(
            width: 0.5,
            height: width * 0.1,
            color: grocery_view_color,
            margin: EdgeInsets.only(left: width * 0.06),
          ),
          Container(
            height: 0.5,
            color: grocery_view_color,
            margin: EdgeInsets.only(left: width * 0.1, top: spacing_control, bottom: spacing_control),
          ),
        ],
      );
    }

    Widget mTitle(var icon, var value, Widget tag, var subValue, var bgColors) {
      return GestureDetector(
        onTap: () {
          tag.launch(context);
        },
        child: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: spacing_standard_new),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColors),
                    width: width * 0.12,
                    height: width * 0.12,
                    padding: EdgeInsets.all(width * 0.03),
                    child: Image.asset(icon, color: grocery_color_white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(value, style: boldTextStyle()),
                      4.height,
                      Text(subValue, style: secondaryTextStyle()),
                    ],
                  )
                ],
              ),
              Icon(Icons.keyboard_arrow_right, color: grocery_textColorSecondary)
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
          backgroundColor: context.cardColor,
          title: Text("Checkout", style: boldTextStyle(size: 18)).paddingOnly(left: spacing_standard),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(grocery_logo, 170, width: 170, fit: BoxFit.fill).center(),
                Text(grocery_title_checkout_details, style: boldTextStyle(size: 18)).paddingAll(spacing_standard_new),
                Container(
                  decoration: boxDecoration(showShadow: true, radius: 10.0),
                  padding: EdgeInsets.all(spacing_middle),
                  margin: EdgeInsets.only(
                    right: spacing_standard_new,
                    left: spacing_standard_new,
                    bottom: spacing_standard_new,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mTitle(
                        Grocery_ic_User,
                        grocery_lbl_recipient_details,
                        GroceryRecipient(),
                        grocery_username,
                        grocery_purpleLightColor,
                      ),
                      mIcon(),
                      mTitle(
                        Grocery_ic_DeliveryTruck,
                        grocery_lbl_delivery_pickup_info,
                        GrocerySelectDeliveryType(),
                        grocery_lbl_pickup_info,
                        grocery_orangeLight_Color,
                      ),
                      mIcon(),
                      mTitle(
                        Grocery_ic_Dollar,
                        grocery_lbl_payment_method,
                        GroceryPaymentMethods(),
                        grocery_lbl_payment_info,
                        grocery_orangeColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SlidingUpPanel(
                maxHeight: _panelHeightOpen,
                minHeight: _panelHeightClosed,
                parallaxEnabled: true,
                parallaxOffset: .5,
                panelBuilder: (sc) => Container(
                  width: width,
                  decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: context.cardColor,
                  ),
                  child: Container(
                    color: context.cardColor,
                    padding: EdgeInsets.all(spacing_standard_new),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: spacing_standard_new),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_colorPrimary),
                              padding: EdgeInsets.all(width * 0.02),
                              child: Icon(Icons.shopping_cart, color: grocery_color_white),
                            ),
                            Text(grocery_lbl_cart_summary, style: boldTextStyle()).expand(),
                            Icon(Icons.keyboard_arrow_up),
                          ],
                        ),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(grocery_lbl_subtotal, style: secondaryTextStyle(size: 16)),
                            Text(grocery_lbl_price, style: boldTextStyle()),
                          ],
                        ),
                        4.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(grocery_lbl_promotion_discount, style: secondaryTextStyle(size: 16)),
                            Text(grocery_lbl_promotion_discount_price, style: boldTextStyle()),
                          ],
                        ),
                        Container(
                          width: width,
                          height: 0.5,
                          color: grocery_view_color,
                          margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(grocery_lbl_delivery_charges, style: secondaryTextStyle(size: 16)),
                            Text(grocery_lbl_delivery_charges_value, style: boldTextStyle()),
                          ],
                        ),
                        SizedBox(height: spacing_control),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(grocery_lbl_total, style: secondaryTextStyle(size: 16)),
                            Text(grocery_lbl_price, style: boldTextStyle()),
                          ],
                        ),
                        SizedBox(height: spacing_standard_new),
                        Align(
                          alignment: Alignment.topRight,
                          child: AppButton(
                            color: grocery_colorPrimary,
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Text(grocery_lbl_pay_now, style: boldTextStyle()),
                            onTap: () {
                              GrocerySaveCart().launch(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
                onPanelSlide: (double pos) => setState(
                  () {
                    fabHeight = pos * (_panelHeightOpen! - _panelHeightClosed) + _initFabHeight;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
