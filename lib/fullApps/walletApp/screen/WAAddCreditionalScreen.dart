import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WADashboardScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/screen/WAVerificationScreen.dart';
import 'package:prokit_flutter/fullApps/walletApp/utils/WAColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';

class WAAddCredentialScreen extends StatefulWidget {
  static String tag = '/WAAddCredentialScreen';

  @override
  WAAddCredentialScreenState createState() => WAAddCredentialScreenState();
}

class WAAddCredentialScreenState extends State<WAAddCredentialScreen> {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Text('SKIP', style: boldTextStyle(color: black)).paddingOnly(right: 16).center().onTap(() {
            WADashboardScreen().launch(context);
          }),
        ],
      ),
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/walletApp/wa_bg.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/walletApp/wa_add_creditional.png',
              width: context.width() * 0.80,
              height: context.width() * 0.80,
              fit: BoxFit.cover,
            ),
            8.height,
            Text(
              'Add Creditionals to Loop',
              style: boldTextStyle(size: 20, color: black),
              textAlign: TextAlign.center,
            ),
            16.height,
            Text(
              'Add your bank credit/debit card to Loop for manage your experience and set your budget for saving',
              style: secondaryTextStyle(color: gray),
              textAlign: TextAlign.center,
            ),
            30.height,
            SizedBox(
              width: context.width() * 0.5,
              child: AppButton(
                  text: "Next",
                  color: WAPrimaryColor,
                  textColor: Colors.white,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  width: context.width(),
                  onTap: () {
                    WAVerificationScreen().launch(context);
                  }),
            ),
          ],
        ).paddingOnly(left: 30, right: 30).paddingTop(40),
      ),
    );
  }
}
