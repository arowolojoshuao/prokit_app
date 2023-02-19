import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/GroceryModel.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryDataGenerator.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class GroceryPaymentMethods extends StatefulWidget {
  static String tag = '/GroceryPaymentMethods';

  @override
  _GroceryPaymentMethodsState createState() => _GroceryPaymentMethodsState();
}

class _GroceryPaymentMethodsState extends State<GroceryPaymentMethods> {
  late List<GroceryPaymentModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = groceryPaymentMethodList();
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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(
        grocery_lbl_payment_method,
        color: context.cardColor,
        titleTextStyle: boldTextStyle(size: 18),
        elevation: 0,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              decoration: boxDecoration(radius: 35.0, bgColor: mList1[index].color),
                              child: Image.asset(mList1[index].cardImg, height: 30, width: 30).paddingAll(spacing_standard),
                            ),
                            16.width,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    8.height,
                                    Text(mList1[index].name, style: boldTextStyle()),
                                    4.height,
                                    Text(mList1[index].cardNumber, style: secondaryTextStyle()),
                                  ],
                                ),
                                Icon(
                                  mList1[index].isSelected == true ? Icons.check_circle : Icons.radio_button_unchecked,
                                  color: mList1[index].isSelected == true ? grocery_colorPrimary : Colors.grey,
                                  size: 30,
                                ),
                              ],
                            ).expand()
                          ],
                        ),
                        8.height,
                        Divider()
                      ],
                    ).paddingOnly(top: spacing_standard, bottom: spacing_standard);
                  }),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    decoration: boxDecoration(radius: 35.0, bgColor: grocery_colorPrimary.withOpacity(0.2)),
                    child: Icon(Icons.credit_card, size: 30, color: grocery_colorPrimary).paddingAll(spacing_standard),
                  ),
                  16.width,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          8.height,
                          Text('Add a Payment Method', style: boldTextStyle()),
                          4.height,
                          Text('Add Credit card or debit card', style: secondaryTextStyle()),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30),
                    ],
                  ).expand()
                ],
              ).paddingOnly(left: 16, right: 16, bottom: 16),
            ],
          ),
        ),
      ),
    );
  }
}
