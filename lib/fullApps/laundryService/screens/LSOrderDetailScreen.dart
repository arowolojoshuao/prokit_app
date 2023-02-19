import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSServiceModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/screens/LSOrderStatusScreen.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSImages.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSOrderDetailScreen extends StatefulWidget {
  static String tag = '/LSOrderDetailScreen';
  final LSServiceModel? data;

  LSOrderDetailScreen(this.data);

  @override
  LSOrderDetailScreenState createState() => LSOrderDetailScreenState();
}

class LSOrderDetailScreenState extends State<LSOrderDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      appBar: appBarWidget('Order Detail', center: true, color: context.cardColor),
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
                  Text('Order No - ${widget.data!.orderNo.validate()}', style: boldTextStyle()),
                  4.height,
                  Text(widget.data!.date.validate(), style: secondaryTextStyle()),
                  Divider(),
                  Text('Items', style: boldTextStyle(size: 18)),
                  Divider(),
                  Text('Wash & fold', style: boldTextStyle()),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('2x T-Shirt', style: primaryTextStyle()),
                          4.width,
                          Text('- (Men)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('5x Truser', style: primaryTextStyle()),
                          4.width,
                          Text('- (Men)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('1x Jeans', style: primaryTextStyle()),
                          4.width,
                          Text('(Men)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  8.height,
                  Text('Wash & Iron', style: boldTextStyle()),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('2x T-Shirt', style: primaryTextStyle()),
                          4.width,
                          Text('- (Women)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('5x Shirt', style: primaryTextStyle()),
                          4.width,
                          Text('- (women)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('1x Jeans', style: primaryTextStyle()),
                          4.width,
                          Text('(Women)', style: secondaryTextStyle()),
                        ],
                      ),
                      Text('\$10.0', style: primaryTextStyle()),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub total', style: boldTextStyle()),
                      Text('\$220.50', style: boldTextStyle()),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax', style: secondaryTextStyle()),
                      Text('\$20.25', style: secondaryTextStyle()),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: boldTextStyle()),
                      Text('\$240.75', style: boldTextStyle()),
                    ],
                  ),
                  8.height,
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
                    decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(40), backgroundColor: LSColorSecondary),
                    padding: EdgeInsets.all(12),
                    child: commonCacheImageWidget(LSShipping, 40, width: 40, fit: BoxFit.cover),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.height,
                      Text('Order Status', style: boldTextStyle()),
                      4.height,
                      Text('This order is out for delivery', style: secondaryTextStyle()),
                      4.height,
                      Text('View Details', style: boldTextStyle(decoration: TextDecoration.underline, color: LSColorPrimary)).onTap(() {
                        LSOrderStatusScreen(widget.data).launch(context);
                      }),
                    ],
                  ).expand()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
