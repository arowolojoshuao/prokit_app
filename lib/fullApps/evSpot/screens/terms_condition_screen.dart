import 'package:flutter/services.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: appStore.isDarkModeOn ? Colors.black : Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms & Conditions', style: boldTextStyle(size: 22)),
            SizedBox(height: 30),
            Text('Company\'s Terms of use', style: secondaryTextStyle(size: 16)),
            SizedBox(height: 8),
            Text(COMPANY_TERMS, style: primaryTextStyle(), textAlign: TextAlign.justify, strutStyle: StrutStyle(fontSize: 18)),
            SizedBox(height: 30),
            Text('Terms & Conditions', style: secondaryTextStyle(size: 16)),
            SizedBox(height: 8),
            Text(TERMS_CONDITIONS, style: primaryTextStyle(), textAlign: TextAlign.justify, strutStyle: StrutStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(TERMS_CONDITIONS, style: primaryTextStyle(), textAlign: TextAlign.justify, strutStyle: StrutStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
