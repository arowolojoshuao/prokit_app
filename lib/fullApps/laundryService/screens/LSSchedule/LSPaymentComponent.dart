import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/laundryService/model/LSAddressModel.dart';
import 'package:prokit_flutter/fullApps/laundryService/utils/LSColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LSPaymentComponent extends StatefulWidget {
  static String tag = '/LSPaymentComponent';

  @override
  LSPaymentComponentState createState() => LSPaymentComponentState();
}

class LSPaymentComponentState extends State<LSPaymentComponent> {
  int? currentTimeValue = 0;
  int? index = 0;
  List<LSSelectionModel>? paymentList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    paymentList!.add(LSSelectionModel(index: 0, title: 'Pay Via PayPal', subTitle: 'Jhondoe@gmail.com'));
    paymentList!.add(LSSelectionModel(index: 1, title: 'Visa Debit Card', subTitle: '**** **** **** 4522'));
    paymentList!.add(LSSelectionModel(index: 2, title: 'Cash On Delivery', subTitle: ''));

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.height(),
        width: context.width(),
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 2),
            Container(
                color: context.scaffoldBackgroundColor,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonCacheImageWidget('https://i.pinimg.com/564x/1a/93/6c/1a936c2a7a60e9900f98d3a77d057599.jpg', 70, width: 80, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        4.height,
                        Text('XPress Laundry', style: boldTextStyle()),
                        4.height,
                        Text('145 Valencia St, San Francisco', style: secondaryTextStyle()),
                      ],
                    ).expand()
                  ],
                )),
            Text('Payment Methods', style: boldTextStyle()).paddingOnly(left: 16, right: 16, top: 16),
            Container(
              margin: EdgeInsets.all(12),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: ListView.separated(
                  separatorBuilder: (_, i) {
                    return Divider(thickness: 1);
                  },
                  itemCount: paymentList!.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    LSSelectionModel data = paymentList![i];
                    return Theme(
                      data: Theme.of(context).copyWith(unselectedWidgetColor: Theme.of(context).iconTheme.color),
                      child: RadioListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(left: 0, bottom: 0),
                        activeColor: LSColorPrimary,
                        value: i,
                        groupValue: currentTimeValue,
                        onChanged: (dynamic ind) {
                          setState(() {
                            currentTimeValue = ind;
                            index = paymentList![currentTimeValue.validate()].index;
                            log(index);
                          });
                        },
                        title: Text(data.title.validate(), style: primaryTextStyle()),
                        subtitle: Text(data.subTitle.validate(), style: secondaryTextStyle()),
                      ),
                    );
                  }),
            ),
            Text('Price Details', style: boldTextStyle()).paddingOnly(left: 16, right: 16, top: 16),
            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: boxDecorationWithRoundedCorners(backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub Total', style: boldTextStyle()),
                      Text('\$220.50', style: primaryTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax', style: boldTextStyle()),
                      Text('\$20.25', style: primaryTextStyle()),
                    ],
                  ),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: boldTextStyle()),
                      Text('\$240.75', style: boldTextStyle()),
                    ],
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
