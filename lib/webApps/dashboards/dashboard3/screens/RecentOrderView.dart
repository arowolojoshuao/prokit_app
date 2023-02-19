import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/models/OrderModel.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Colors.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Common.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/Constants.dart';
import 'package:prokit_flutter/webApps/dashboards/dashboard3/utils/DataProvider.dart';

class RecentOrderView extends StatefulWidget {
  @override
  RecentOrderViewState createState() => RecentOrderViewState();
}

class RecentOrderViewState extends State<RecentOrderView> {
  List<OrderModel> orderList = getOrderList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height(),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      color: secondaryColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HoverWidget(
              builder: (context, isHover) {
                return Container(
                  width: context.width(),
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationRoundedWithShadow(
                    cardRadius.toInt(),
                    backgroundColor: isHover ? primaryColor : white,
                  ),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          Image.asset(
                            'images/webDashBoard3/profile.jpg',
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                          ).cornerRadiusWithClipRRect(4),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'John Smith',
                                style: boldTextStyle(color: isHover ? white : primaryColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'Head of Sales',
                                style: primaryTextStyle(size: 14, color: isHover ? white : primaryColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                'johnsmith@crml.com',
                                style: primaryTextStyle(size: 12, color: isHover ? white : primaryColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: radius(5),
                          backgroundColor: isHover ? white : primaryColor,
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: isHover ? primaryColor : white,
                        ).onTap(
                          () {
                            toasty(context, 'View More');
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            16.height,
            HoverWidget(
              builder: (context, isHover) {
                return Container(
                  width: context.width(),
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationRoundedWithShadow(
                    cardRadius.toInt(),
                    backgroundColor: isHover ? primaryColor : white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Award',
                        style: boldTextStyle(size: 18, color: isHover ? white : primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      8.height,
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            height: 45,
                            width: 50,
                            padding: EdgeInsets.all(4),
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(cardRadius),
                              backgroundColor: isHover ? white : secondaryColor,
                            ),
                            child: Icon(Ionicons.star_outline, color: primaryColor),
                          ),
                          8.width,
                          Text(
                            'Star Seller',
                            style: primaryTextStyle(color: isHover ? white : primaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top item of this month',
                    style: boldTextStyle(size: 18, color: primaryColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.height,
                  Container(
                    height: 62,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        OrderModel e = orderList.last;
                        orderList.sort((a, b) => a.quantity!.compareTo(b.quantity!));
                        return HoverWidget(
                          builder: (context, isHover) {
                            return SettingItemWidget(
                              padding: EdgeInsets.all(8),
                              decoration: commonCardDecoration(context, isHover: isHover),
                              leading: Container(
                                height: 45,
                                width: 50,
                                padding: EdgeInsets.all(4),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(cardRadius),
                                  backgroundColor: secondaryColor,
                                ),
                                child: Icon(e.icon, color: primaryColor),
                              ),
                              title: e.name!,
                              titleTextStyle: primaryTextStyle(color: isHover ? white : primaryColor),
                              subTitle: "${e.quantity} pieces",
                              subTitleTextStyle: primaryTextStyle(color: isHover ? white : primaryColor),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              decoration: boxDecorationRoundedWithShadow(cardRadius.toInt(), backgroundColor: white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Orders',
                        style: boldTextStyle(size: context.width() < 1200 ? 12 : 15, color: primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'SEE ALL',
                        style: primaryTextStyle(size: context.width() < 1200 ? 10 : 15, color: primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ).onTap(() {
                        toasty(context, 'Scroll to see all');
                      }),
                    ],
                  ),
                  16.height,
                  Container(
                    height: context.height() * 0.43,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: orderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        OrderModel e = orderList[index];
                        return HoverWidget(
                          builder: (context, isHover) {
                            return SettingItemWidget(
                              decoration: commonCardDecoration(context, isHover: isHover),
                              padding: EdgeInsets.all(8),
                              leading: Container(
                                height: 45,
                                width: 50,
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(cardRadius),
                                  backgroundColor: secondaryColor,
                                ),
                                child: Icon(e.icon, color: primaryColor),
                              ),
                              title: '${e.name}',
                              titleTextStyle: boldTextStyle(color: isHover ? white : primaryColor),
                              subTitle: context.width() <= 1200 ? '\$${e.price}' : '${e.time}m ago',
                              subTitleTextStyle: boldTextStyle(color: isHover ? white : primaryColor),
                              trailing: Text(
                                context.width() <= 1200 ? '' : '\$${e.price}',
                                style: boldTextStyle(color: isHover ? white : primaryColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
