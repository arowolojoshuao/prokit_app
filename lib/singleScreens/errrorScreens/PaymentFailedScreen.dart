import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';

class PaymentFailedScreen extends StatefulWidget {
  const PaymentFailedScreen({Key? key}) : super(key: key);

  @override
  _PaymentFailedScreenState createState() => _PaymentFailedScreenState();
}

class _PaymentFailedScreenState extends State<PaymentFailedScreen> {
  @override
  void initState() {
    setStatusBarColor(Color(0xFFEFF1F3));
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('images/errorScreens/15_Payment Error.png', fit: BoxFit.cover, height: context.height()),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Payment Failed', style: boldTextStyle(size: 30, color: Colors.black)),
                16.height,
                Text(
                  'Your card was rejected by the vendor. Please try again',
                  style: primaryTextStyle(size: 18, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(vertical: 8, horizontal: 40),
                32.height,
                AppButton(
                  child: Text('BACK', style: boldTextStyle(color: white)).paddingSymmetric(horizontal: 32),
                  shapeBorder: RoundedRectangleBorder(borderRadius: radius(30)),
                  color: Color(0xFFF16F66),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    toast('BACK');
                  },
                ),
                100.height,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
