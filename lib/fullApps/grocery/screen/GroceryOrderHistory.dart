import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_compleated_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryTrackOrder.dart';

class GroceryOrderHistoryScreen extends StatefulWidget {
  static String tag = '/GroceryOrderHistoryScreen';

  @override
  _GroceryOrderHistoryScreenState createState() => _GroceryOrderHistoryScreenState();
}

class _GroceryOrderHistoryScreenState extends State<GroceryOrderHistoryScreen> {
  List<Compleated> listCompleated = compleated;

  @override
  Widget build(BuildContext context) {
    final compleated = ListView.builder(
        itemCount: listCompleated.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, radius: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      color: grocery_colorPrimary,
                      child: Icon(Icons.shopping_cart, color: grocery_color_white),
                    ).cornerRadiusWithClipRRect(25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listCompleated[index].orderDate, style: boldTextStyle(size: 18)).paddingOnly(bottom: 16),
                          Text(
                            grocery_subtotal + ' ' + grocery_currency + ' ' + listCompleated[index].orderAmount,
                            style: primaryTextStyle(),
                          ),
                          4.height,
                          Text(grocery_totalItems + ': ' + listCompleated[index].totelItem, style: secondaryTextStyle())
                        ],
                      ).paddingOnly(left: 16, right: 16),
                    ),
                    Icon(
                      Icons.delete_outline,
                      color: grocery_textColorSecondary,
                    ),
                  ],
                ),
                Divider().paddingOnly(top: 8),
                Align(
                  alignment: Alignment.topRight,
                  child: AppButton(
                    color: grocery_textColorSecondary,
                    onTap: () {},
                    child: Text(grocery_viewCart, style: boldTextStyle()),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
              ],
            ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
          ).paddingOnly(left: 16, right: 16, top: 16).onTap(() {
            GroceryTrackOrderScreen().launch(context);
          });
        });

    return Scaffold(
      backgroundColor: grocery_app_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(125),
              child: Container(
                  color: grocery_colorPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      16.height,
                      Row(
                        children: <Widget>[
                          Icon(Icons.clear, size: 24, color: grocery_color_white).paddingOnly(right: 24).onTap(
                            () {
                              finish(context);
                            },
                          ),
                          Text(grocery_orderHistory, style: boldTextStyle(size: 18)).expand(),
                          Icon(Icons.search, size: 24, color: grocery_color_white),
                        ],
                      ).paddingOnly(left: 12, right: 16),
                      8.height,
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: TabBar(
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: grocery_color_white,
                            labelColor: grocery_color_white,
                            isScrollable: true,
                            unselectedLabelColor: grocery_color_white.withOpacity(0.5),
                            tabs: [
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_completed,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_upComming,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  grocery_cancelled,
                                  style: TextStyle(fontSize: textSizeMedium),
                                ),
                              )
                            ],
                          ),
                        ),
                      ).paddingOnly(top: 22),
                    ],
                  )),
            ),
            body: TabBarView(
              children: <Widget>[compleated, compleated, compleated],
            ),
          ),
        ),
      ),
    );
  }
}
