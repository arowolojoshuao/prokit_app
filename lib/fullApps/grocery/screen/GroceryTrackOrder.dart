import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_trackOrder_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryTrackOrderScreen extends StatefulWidget {
  static String tag = '/GroceryTrackOrderScreen';

  @override
  _GroceryTrackOrderScreenState createState() => _GroceryTrackOrderScreenState();
}

class _GroceryTrackOrderScreenState extends State<GroceryTrackOrderScreen> {
  List<TrackOrder> listTrackOrder = trackOrder;

  @override
  Widget build(BuildContext context) {
    final trackOrder = ListView.builder(
      itemCount: listTrackOrder.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecoration(showShadow: true, radius: 10.0, bgColor: context.cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: grocery_purpleLightColor,
                    child: Icon(Icons.shopping_cart, color: grocery_color_white),
                  ).cornerRadiusWithClipRRect(25),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listTrackOrder[index].orderName, style: boldTextStyle(size: 18)).paddingOnly(bottom: 16),
                        Text(
                          grocery_subtotal + ' ' + grocery_currency + ' ' + listTrackOrder[index].orderAmount,
                          style: primaryTextStyle(),
                        ),
                        4.height,
                        Text(grocery_totalItems + ': ' + listTrackOrder[index].totelItem, style: secondaryTextStyle())
                      ],
                    ).paddingOnly(left: 16, right: 16),
                  ),
                ],
              ),
              8.height,
              Divider(),
              Align(
                alignment: Alignment.topRight,
                child: AppButton(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(grocery_trackOrders, style: boldTextStyle()),
                  color: grocery_colorPrimary,
                  onTap: () {},
                ),
              )
            ],
          ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
        ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {});
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(Icons.clear, size: 24, color: grocery_color_white).onTap(
          () {
            finish(context);
          },
        ),
        title: Text(grocery_trackOrders, style: boldTextStyle(size: 18)),
      ),
      body: trackOrder,
    );
  }
}
