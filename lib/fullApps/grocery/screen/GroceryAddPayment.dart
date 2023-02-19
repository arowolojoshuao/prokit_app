import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/grocery/model/grocery_addPayment_model.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GeoceryStrings.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryColors.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryConstant.dart';
import 'package:prokit_flutter/fullApps/grocery/utils/GroceryImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'GroceryAddCard.dart';

class GroceryAddPaymentScreen extends StatefulWidget {
  static String tag = '/GroceryAddPaymentScreen';

  @override
  _GroceryAddPaymentScreenState createState() => _GroceryAddPaymentScreenState();
}

class _GroceryAddPaymentScreenState extends State<GroceryAddPaymentScreen> {
  @override
  void initState() {
    super.initState();
    changeStatusColor(grocery_colorPrimary);
  }

  @override
  void dispose() {
    super.dispose();
    changeStatusColor(grocery_colorPrimary);
  }

  List<AddPayment> listAddPayment = addPayment;
  String? cardNumber = '';

  @override
  Widget build(BuildContext context) {
    final trackOrder = ListView.builder(
      itemCount: listAddPayment.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecorationWithShadow(
            borderRadius: BorderRadius.circular(8),
            boxShadow: defaultBoxShadow(),
            backgroundColor: context.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(listAddPayment[index].cardName, style: boldTextStyle(size: 18)),
                  8.height,
                  Icon(Icons.delete_outline, color: grocery_textColorSecondary).onTap(
                    () {
                      cardNumber = listAddPayment[index].cardNumber;
                      removeCardBottomSheet(context);
                    },
                  )
                ],
              ),
              text(
                listAddPayment[index].cardNumber,
                fontSize: textSizeNormal,
                fontFamily: fontMedium,
                textColor: textSecondaryColor,
              ).paddingOnly(bottom: 16),
              Row(
                children: [
                  text(grocery_month + " / ", fontSize: textSizeMedium, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                  text(grocery_year, fontSize: textSizeMedium, fontFamily: fontMedium, textColor: grocery_textColorSecondary),
                ],
              ),
              Row(
                children: [
                  text(listAddPayment[index].expMonth + " / ", fontSize: textSizeMedium, fontFamily: fontMedium),
                  text(listAddPayment[index].expYear, fontSize: textSizeMedium, fontFamily: fontMedium),
                ],
              ),
              8.height,
              Row(
                children: [
                  Expanded(
                    child: Text(listAddPayment[index].bankName, style: secondaryTextStyle()),
                  ),
                  commonCacheImageWidget(
                    listAddPayment[index].cardType == 'visa' ? grocery_ic_visa : grocery_ic_masterCard,
                    40,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ],
          ).paddingOnly(left: 16, right: 16, top: 16, bottom: 16),
        ).paddingOnly(left: 16, right: 16, top: 16).onTap(
          () {
            GroceryAddCardScreen().launch(context);
          },
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grocery_colorPrimary,
        leading: Icon(Icons.arrow_back, size: 30, color: grocery_color_white).onTap(
          () {
            finish(context);
          },
        ),
        title: text(grocery_paymentMethod, fontSize: textSizeNormal, textColor: grocery_color_white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            trackOrder,
            Container(
              margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new, top: spacing_standard_new),
              decoration: boxDecorationWithShadow(boxShadow: defaultBoxShadow(), backgroundColor: context.cardColor),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 30, color: grocery_textColorSecondary),
                  text(grocery_addCard),
                ],
              ),
            ).onTap(
              () {
                GroceryAddCardScreen().launch(context);
              },
            ),
          ],
        ).paddingOnly(bottom: 16),
      ),
    );
  }

  removeCardBottomSheet(context) async {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(spacing_large),
                  topRight: Radius.circular(spacing_large),
                ),
                color: context.cardColor,
              ),
              height: context.height() / 2.8,
              padding: EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: spacing_standard_new, top: spacing_middle),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: grocery_color_red),
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                        child: Icon(Icons.delete, color: grocery_color_white),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(grocery_lbl_remove_an_item, style: boldTextStyle(size: 18)),
                            Text(
                              grocery_removeMsg + ' ' + cardNumber! + ' ' + grocery_card + '?',
                              style: secondaryTextStyle(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  24.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text("$grocery_lbl_no", style: boldTextStyle()),
                        color: context.cardColor,
                        onTap: () {
                          finish(context);
                        },
                      ),
                      16.width,
                      AppButton(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Text(grocery_lbl_remove, style: boldTextStyle()),
                        color: grocery_color_red,
                        onTap: () {
                          finish(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
