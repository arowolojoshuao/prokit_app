import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSOrderStatusScreen extends StatefulWidget {
  static String tag = '/LSOrderStatusScreen';
  final LSServiceModel? data;

  LSOrderStatusScreen(this.data);

  @override
  LSOrderStatusScreenState createState() => LSOrderStatusScreenState();
}

class LSOrderStatusScreenState extends State<LSOrderStatusScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Widget statusView(String? title, String? subTitle, String? icon, String? time) {
    return Row(
      children: [
        commonCacheImageWidget(icon.validate(), 30, width: 30, fit: BoxFit.cover),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title.validate(value: ''), style: boldTextStyle()),
                Text(time.validate(value: ''), style: boldTextStyle()),
              ],
            ),
            Text(subTitle.validate(), style: secondaryTextStyle()),
          ],
        ).expand()
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      appBar: appBarWidget('Order Status', center: true, color: context.cardColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.width(),
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order No - ${widget.data!.orderNo.validate()}', style: boldTextStyle()),
                      Text('\$240.75', style: boldTextStyle()),
                    ],
                  ),
                  Divider(),
                  Text('Order Status', style: boldTextStyle()),
                  Divider(),
                  statusView('Confirmed', 'Your order has been confirmed', LSConfirm, '11:00 AM'),
                  Container(
                    height: 30,
                    width: 2,
                    color: greenColor,
                    margin: EdgeInsets.only(left: 10),
                  ),
                  statusView('Picked Up', 'Your order has been picked up', LSPickup, '12:50 PM'),
                  Container(
                    height: 30,
                    width: 2,
                    color: greenColor,
                    margin: EdgeInsets.only(left: 10),
                  ),
                  statusView('In Process', 'Your order is now in-process', LSInProgress, '06:30 PM'),
                  Container(
                    height: 30,
                    width: 2,
                    color: greenColor,
                    margin: EdgeInsets.only(left: 10),
                  ),
                  statusView('Shipped', 'Your order is out of delivery', LSShipping, '09:20 AM'),
                  Container(
                    height: 30,
                    width: 2,
                    color: grey.withOpacity(0.5),
                    margin: EdgeInsets.only(left: 10),
                  ),
                  Stack(
                    children: [
                      statusView('Delivered', 'Your order has been confirmed', LSWalk3, '10:30 AM'),
                      Container(
                        height: 40,
                        width: context.width(),
                        color: appStore.isDarkModeOn ? Colors.transparent : white.withOpacity(0.6),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: context.width(),
              margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: Colors.green.shade50),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.call, size: 30, color: Colors.green),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Call the delivery agent', style: boldTextStyle()),
                      4.height,
                      Text('Call him if you have any query', style: secondaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
            ),
            Container(
              width: context.width(),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: Colors.blue.shade50),
                    padding: EdgeInsets.all(8),
                    child: Icon(LineIcons.facebook_messenger, size: 30, color: Colors.blue),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Message the delivery agent', style: boldTextStyle()),
                      4.height,
                      Text('Message him if you have any query', style: secondaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
            ),
            Container(
              width: context.width(),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: Colors.blue.shade50),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.pin_drop, size: 30, color: Colors.red),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Pick up & Delivery Address', style: boldTextStyle()),
                      4.height,
                      Text(widget.data!.location.validate(), style: secondaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
            ),
            Container(
              width: context.width(),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: Colors.blue.shade50),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.send, size: 30, color: Colors.blue),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Track delivery guy\'s location', style: boldTextStyle()),
                      4.height,
                      Text('He will be there at your doorstep shortly', style: secondaryTextStyle()),
                    ],
                  ).expand()
                ],
              ),
            ),
            Container(
              width: context.width(),
              margin: EdgeInsets.only(top: 16, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Laundry Shop', style: boldTextStyle()),
                  12.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(16),
                        child: commonCacheImageWidget(LSWashingClothes, 50, width: 50, fit: BoxFit.cover),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          4.height,
                          Text('Dhobee Laundry', style: boldTextStyle()),
                          4.height,
                          Row(
                            children: [
                              RatingBarWidget(
                                rating: 3.5,
                                size: 18,
                                disable: true,
                                itemCount: 5,
                                onRatingChanged: (aRating) {
                                  //
                                },
                              ),
                              4.width,
                              Text('3.5', style: secondaryTextStyle()),
                            ],
                          )
                        ],
                      ).expand(),
                      Container(
                        decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: Colors.blue.shade50),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.call, size: 30, color: Colors.blue),
                      ),
                    ],
                  ),
                  12.height,
                  Text('1810 Cammon Realm Redwood City, CA 94063 United states', style: secondaryTextStyle()),
                  8.height
                ],
              ),
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
