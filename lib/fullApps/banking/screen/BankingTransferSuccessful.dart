import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingTransferSuccessful extends StatefulWidget {
  static var tag = "/BankingTransferSuccessful";

  @override
  _BankingTransferSuccessfulState createState() => _BankingTransferSuccessfulState();
}

class _BankingTransferSuccessfulState extends State<BankingTransferSuccessful> {
  @override
  Widget build(BuildContext context) {
    var width = context.width();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            8.height,
            headerView(Banking_lbl_Transfer_Successful, width * 0.4, context),
            24.height,
            Image.asset(Banking_ic_walk2, height: width * 0.6, width: width, fit: BoxFit.cover),
            24.height,
            Text(
              Banking_lbl_Info_Transfer_Successful,
              style: primaryTextStyle(color: Banking_TextColorSecondary),
              textAlign: TextAlign.center,
            ).center(),
            8.height,
            BankingButton(
              textContent: Banking_lbl_Transaction_History,
              onPressed: () {
                finish(context);
              },
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
