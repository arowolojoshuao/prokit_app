import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSSignInScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';

import '../../../main.dart';

class SSResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0x00000000), width: 1),
          borderRadius: BorderRadius.zero,
        ),
        leading: InkWell(
          onTap: () {
            finish(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("images/sneakerShopping/ic_checkmark.png"),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                color: appStore.isDarkModeOn ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 32),
            Text("Reset Successful", textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
            SizedBox(height: 32, width: 16),
            sSAppButton(
              context: context,
              title: 'Sign in now',
              onPressed: () {
                SSSignInScreen().launch(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
