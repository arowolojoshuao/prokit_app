import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/orapay/screens/op_user_detail.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/Colors.dart';
import 'package:prokit_flutter/fullApps/orapay/utils/OPWidgets.dart';

class OPLoginScreen extends StatefulWidget {
  @override
  _OPLoginScreenState createState() => _OPLoginScreenState();
}

class _OPLoginScreenState extends State<OPLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100),
                    applogo(),
                    24.height,
                    Text("Login", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                    24.height,
                    TextField(
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: secondaryTextStyle(size: 16),
                        fillColor: Colors.grey,
                        suffixIcon: Icon(Icons.person_outline, color: Colors.grey, size: 24),
                      ),
                    ),
                    16.height,
                    TextField(
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: secondaryTextStyle(size: 16),
                        fillColor: Colors.grey,
                        suffixIcon: Icon(Icons.lock_outline, color: Colors.grey, size: 24),
                      ),
                    ),
                  ],
                ),
              ),
              AppButton(
                width: context.width() - 32,
                child: Text("Login", textAlign: TextAlign.center, style: primaryTextStyle(size: 16, color: Colors.white)),
                color: opPrimaryColor,
                onTap: () {
                  OPUserDetailsScreen().launch(context);
                },
              ).cornerRadiusWithClipRRect(16),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 24),
        ),
      ),
    );
  }
}
