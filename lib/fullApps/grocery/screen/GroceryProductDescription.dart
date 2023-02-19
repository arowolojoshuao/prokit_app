import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

import 'GroceryReviews.dart';

class GroceryProductDescription extends StatefulWidget {
  static String tag = '/ProductDescription';

  @override
  GroceryProductDescriptionState createState() => GroceryProductDescriptionState();
}

class GroceryProductDescriptionState extends State<GroceryProductDescription> {
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
      appBar: appBarWidget(
        grocery_title_grocery_deals,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              finish(context);
            },
            icon: Icon(Icons.favorite_border, color: appStore.isDarkModeOn ? white : black),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: context.width(),
                padding: EdgeInsets.only(bottom: spacing_standard_new),
                margin: EdgeInsets.only(
                  top: context.width() * 0.2,
                  left: spacing_standard_new,
                  right: spacing_standard_new,
                ),
                decoration: boxDecoration(showShadow: true, radius: 10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: context.width() * 0.17),
                    Text(grocery_lbl_product_name, style: boldTextStyle(size: 18)),
                    8.height,
                    Container(
                      padding: EdgeInsets.only(left: spacing_control, right: spacing_control),
                      decoration: boxDecoration(radius: spacing_control, bgColor: grocery_light_gray_color),
                      child: Text("1KG", style: boldTextStyle(color: black)),
                    ),
                    8.height,
                    Text(grocery_lbl_price, style: boldTextStyle()),
                    24.height,
                    RatingBar(
                      initialRating: 5,
                      minRating: 1,
                      itemSize: 25,
                      direction: Axis.horizontal,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(Icons.star, color: grocery_color_yellow),
                      onRatingUpdate: (rating) {},
                    ),
                    16.height,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: spacing_standard, vertical: 4),
                      decoration: boxDecoration(radius: spacing_large, bgColor: grocery_orangeColor_light),
                      child: Text(grocery_lbl_product_rating, style: boldTextStyle(color: black)),
                    ).onTap(() {
                      GroceryReviews().launch(context);
                    }),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.remove_circle_outline, size: 30, color: grocery_icon_color),
                        16.width,
                        Text(grocery_lbl_product_weight, style: boldTextStyle(size: 18)),
                        16.width,
                        Icon(Icons.add_circle_outline, size: 30, color: grocery_icon_color),
                      ],
                    ),
                    16.height,
                    AppButton(
                      color: grocery_colorPrimary,
                      child: Text(grocery_lbl_add_to_cart.toUpperCase(), style: boldTextStyle(color: white)),
                      onTap: () {
                        //
                      },
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    ),
                    16.height,
                    AppButton(
                      color: context.cardColor,
                      child: Text(grocery_lbl_buy_now.toUpperCase(), style: boldTextStyle()),
                      onTap: () {
                        //
                      },
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(spacing_standard_new),
                  decoration: boxDecoration(showShadow: true, radius: 10.0),
                  height: context.width() * 0.35,
                  width: context.width() * 0.6,
                  child: commonCacheImageWidget(grocery_ic_carrot, 150, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
