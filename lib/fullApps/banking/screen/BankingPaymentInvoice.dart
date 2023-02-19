import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingInvoiceDetail.dart';

import '../utils/BankingColors.dart';
import '../utils/BankingContants.dart';
import '../utils/BankingStrings.dart';
import '../utils/BankingWidget.dart';

class BankingPaymentInvoice extends StatefulWidget {
  static var tag = "/BankingPaymentInvoice";

  @override
  _BankingPaymentInvoiceState createState() => _BankingPaymentInvoiceState();
}

class _BankingPaymentInvoiceState extends State<BankingPaymentInvoice> {
  var currentIndexPage = 0;
  List<BankingCardModel>? mList;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            16.height,
            headerView(Banking_lbl_Payment_Invoice, width * 0.4, context),
            16.height,
            Text("Invoice Feb 2020", style: secondaryTextStyle()).paddingSymmetric(horizontal: spacing_standard_new),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Name", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("John Smith", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Address", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("874 Cameron Road,NY,US", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Code", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("#7783", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("TimeService", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("25 Jan - 25 Feb", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Amount Transaction", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("\$200", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Status", style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text("Payment Successful", style: primaryTextStyle()),
                  ],
                ).paddingSymmetric(horizontal: spacing_standard_new, vertical: spacing_standard),
                Divider().paddingOnly(left: spacing_standard, right: spacing_standard)
              ],
            ),
            16.height,
            BankingButton(
              textContent: Banking_lbl_Confirm,
              onPressed: () {
                BankingInvoiceDetail().launch(context);
              },
            ).paddingAll(spacing_standard_new),
          ],
        ),
      ),
    );
  }
}
