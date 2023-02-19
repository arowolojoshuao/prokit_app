import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/coinPro/utils/CPImages.dart';

import 'CPIdCardScreen.dart';

class CPVerifyEmail extends StatefulWidget {
  @override
  CPVerifyEmailState createState() => CPVerifyEmailState();
}

class CPVerifyEmailState extends State<CPVerifyEmail> {
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 60),
            Image(
              image: AssetImage(cp_senMail),
              height: 200,
              width: context.width(),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16, width: 16),
            Text(
              "Verify your email",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                fontSize: 18,
                // color: Color(0xff000000),
              ),
            ),
            SizedBox(height: 16, width: 16),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "We sent a verification code to your email.\nplease tap the link inside that email to \ncontinue",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                CPIdCardScreen().launch(context);
              },
              color: Color(0xff2972ff),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                "Check my inbox",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal),
              ),
              textColor: Color(0xffffffff),
              height: 40,
              minWidth: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
              child: TextButton(
                onPressed: () {
                  //
                },
                child: Text(
                  "Resend email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                ),
                //  textColor: Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
