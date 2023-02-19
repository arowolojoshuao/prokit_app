import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/model/BankingModel.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingSavingSuccessful.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingContants.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingSlider.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';
import 'package:prokit_flutter/main.dart';

class BankingAddNewSaving extends StatefulWidget {
  static var tag = "/BankingAddNewSaving";

  @override
  _BankingAddNewSavingState createState() => _BankingAddNewSavingState();
}

class _BankingAddNewSavingState extends State<BankingAddNewSaving> {
  var currentIndexPage = 0;
  List<BankingCardModel>? mList;
  var isTapped = false;
  var tapCount = 0;

  @override
  Widget build(BuildContext context) {
    void tappedConfirm() {
      if (tapCount != 1) {
        BankingSavingSuccessful().launch(context);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.chevron_left,
                  size: 25,
                  color: appStore.isDarkModeOn ? white : Banking_blackColor,
                ).onTap(
                  () {
                    finish(context);
                  },
                ),
                20.height,
                Text(Banking_lbl_Add_New_Saving, style: boldTextStyle(size: 30)),
                5.height,
                Text(Banking_lbl_Choose_Account_to_Saving, style: secondaryTextStyle()),
              ],
            ).paddingAll(8),
            20.height,
            BankingSliderWidget(),
            8.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Choose Time Deposit', style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Row(
                      children: <Widget>[
                        Text('12 Months', style: primaryTextStyle()),
                        10.width,
                        Icon(Icons.keyboard_arrow_right, size: 30, color: Banking_greyColor),
                      ],
                    ),
                  ],
                ),
                Divider(height: 24),
                4.height,
                Align(
                  alignment: Alignment.topRight,
                  child: Text('Interest rate 8%', style: primaryTextStyle(color: Banking_TextColorSecondary)),
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Amount(At least \$10)', style: primaryTextStyle(color: Banking_TextColorSecondary)),
                    Text('\$1000', style: primaryTextStyle()),
                  ],
                ),
                Divider(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('A OTP Code has been send to your Phone', style: secondaryTextStyle()),
                    EditText(text: "Enter OTP", isPassword: false),
                    8.height,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(Banking_lbl_Resend, style: primaryTextStyle(size: 18)).onTap(() {}),
                    ),
                    8.height,
                    Text('Use Face ID to verify transaction', style: secondaryTextStyle()),
                    24.height,
                    Image.asset(
                      Banking_ic_face_id,
                      color: Banking_Primary,
                      height: 50,
                      width: 50,
                    ).center().paddingSymmetric(vertical: spacing_standard_new),
                  ],
                ).visible(isTapped == true),
                16.height,
                BankingButton(
                  textContent: Banking_lbl_Confirm,
                  onPressed: () {
                    setState(
                      () {
                        isTapped = true;
                        tapCount = tapCount + 1;
                        tappedConfirm();
                      },
                    );
                  },
                ),
                8.height,
              ],
            ).paddingOnly(left: 8, right: 8)
          ],
        ),
      ),
    );
  }
}
