import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/stockMarket/screens/walkthrough_screen.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/common.dart';
import 'package:prokit_flutter/fullApps/stockMarket/utils/images.dart';

class SMSplashScreen extends StatefulWidget {
  static String tag = '/stock_market';

  const SMSplashScreen({Key? key}) : super(key: key);

  @override
  _SMSplashScreenState createState() => _SMSplashScreenState();
}

class _SMSplashScreenState extends State<SMSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await 2.seconds.delay.then((value) {
      WalkThroughScreen().launch(context);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCachedNetworkImage(splash_logo, fit: BoxFit.cover, color: greenColor, width: 100, height: 100),
            24.height,
            Text('Stock Investment', style: boldTextStyle(size: 24)),
          ],
        ),
      ),
    );
  }
}
