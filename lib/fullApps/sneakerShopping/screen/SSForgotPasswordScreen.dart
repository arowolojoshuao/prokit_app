import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/screen/SSVerifyNumberScreen.dart';
import 'package:prokit_flutter/fullApps/sneakerShopping/utils/SSWidgets.dart';

import '../../../main.dart';

class SSForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: context.iconColor, size: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 16),
            Text("Forgot Password", style: boldTextStyle(size: 18)),
            SizedBox(height: 16, width: 16),
            Text("Enter your mobile number", style: primaryTextStyle()),
            SizedBox(height: 16, width: 16),
            TextField(
              controller: TextEditingController(),
              obscureText: false,
              textAlign: TextAlign.start,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 14, color: Color(0xff000000)),
              decoration: sSInputDecoration(
                context: context,
                name: 'Mobile',
                icon: Icon(Icons.call, color: Colors.grey.withOpacity(0.4), size: 24),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  SSVerifyNumberScreen().launch(context);
                },
                child: Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? context.cardColor : Color(0xff010101),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
