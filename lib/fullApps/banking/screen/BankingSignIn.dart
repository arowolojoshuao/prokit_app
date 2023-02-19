import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingDashboard.dart';
import 'package:prokit_flutter/fullApps/banking/screen/BankingForgotPassword.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingColors.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingImages.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingStrings.dart';
import 'package:prokit_flutter/fullApps/banking/utils/BankingWidget.dart';

class BankingSignIn extends StatefulWidget {
  static var tag = "/BankingSignIn";

  @override
  _BankingSignInState createState() => _BankingSignInState();
}

class _BankingSignInState extends State<BankingSignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
              16.height,
              EditText(text: "Phone", isPassword: false),
              8.height,
              EditText(text: "Password", isPassword: true, isSecure: true),
              16.height,
              Align(
                alignment: Alignment.centerRight,
                child: Text(Banking_lbl_Forgot, style: secondaryTextStyle(size: 16)).onTap(
                  () {
                    BankingForgotPassword().launch(context);
                  },
                ),
              ),
              16.height,
              BankingButton(
                textContent: Banking_lbl_SignIn,
                onPressed: () {
                  BankingDashboard().launch(context);
                },
              ),
              16.height,
              Column(
                children: [
                  Text(
                    Banking_lbl_Login_with_FaceID,
                    style: primaryTextStyle(size: 16, color: Banking_TextColorSecondary),
                  ),
                  16.height,
                  Image.asset(Banking_ic_face_id, color: Banking_Primary, height: 40, width: 40),
                ],
              ).center(),
            ],
          ),
        ),
      ),
    );
  }
}
